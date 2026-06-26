const fs = require('fs');
const { marked } = require('marked');
const yaml = require('js-yaml');

// ============================================================================
// HELPER FUNCTIONS
// ============================================================================

function loadMetadata(profileName) {
  const path = profileName
    ? `profiles/${profileName}.metadata.yaml`
    : 'profiles/ai-automation.metadata.yaml'; // default
  console.log(`📂 Loading profile: ${path}`);
  const content = fs.readFileSync(path, 'utf8');
  return yaml.load(content);
}

function generateHeader(metadata) {
  const contactItems = metadata.header.contact.map(item => {
    const content = item.link 
      ? `<a href="${item.link}"${item.type === 'github' || item.type === 'portfolio' ? ' target="_blank"' : ''}>${item.value}</a>`
      : `<span>${item.value}</span>`;
    
    return `
                        <div class="contact-item">
                            <span>${item.icon}</span>
                            ${content}
                        </div>`;
  }).join('');

  return `
            <header class="header">
                <div class="header-content">
                    <h1>${metadata.header.name}</h1>
                    <div class="subtitle">${metadata.header.title}</div>
                    <div class="contact-info">${contactItems}
                    </div>
                </div>
            </header>`;
}

function generateNavigation(metadata) {
  const links = metadata.navigation.map(item => 
    `<a href="${item.href}">${item.label}</a>`
  ).join('\n                ');
  
  return `
            <div class="nav-links">
                ${links}
            </div>`;
}

function generateSkills(metadata) {
  const cards = metadata.skills.categories.map(category => {
    const items = category.items.map(item => 
      `<p><strong>${item.label}:</strong> ${item.content}</p>`
    ).join('\n                            ');
    
    return `
                        <div class="skill-card">
                            <h3>${category.icon} ${category.title}</h3>
                            ${items}
                        </div>`;
  }).join('');

  return `
                <section id="skills" class="animate-in">
                    <h2>Technical Skills</h2>
                    <div class="skills-grid">${cards}
                    </div>
                </section>`;
}

function renderProjectCard(project) {
  const isNDA = project.nda === true;
  const ndaBadge = isNDA
    ? `<span class="nda-badge" title="Project details restricted under NDA" style="
        display: inline-block;
        font-size: 11px;
        font-weight: 600;
        color: #92400e;
        background: #fef3c7;
        border: 1px solid #f59e0b;
        border-radius: 4px;
        padding: 1px 7px;
        margin-left: 8px;
        vertical-align: middle;
        letter-spacing: 0.03em;
      ">NDA</span>`
    : '';

  return `
                        <div class="project-card${isNDA ? ' nda-project' : ''}">
                            <div class="project-title">${project.title}${ndaBadge}</div>
                            <div class="project-tech">${project.tech}</div>
                            <div class="project-description">
                                ${project.description}
                            </div>
                        </div>`;
}

function generateProjects(metadata) {
  let html = `
                <section id="projects" class="animate-in">
                    <h2>Featured Projects</h2>
                    `;

  let first = true;
  for (const [, category] of Object.entries(metadata.projects)) {
    const cards = category.items.map(renderProjectCard).join('');
    const marginStyle = first ? '' : ' style="margin-top: 40px;"';
    first = false;

    html += `
                    <h3${marginStyle}>${category.title}</h3>
                    <div class="projects-grid">${cards}
                    </div>`;
  }

  html += `
                </section>`;

  return html;
}


// ============================================================================
// EXPERIENCE PARSER
// ============================================================================

function parseExperience(markdown, metadata) {
  // Extract Professional Experience section
  const expMatch = markdown.match(/## Professional Experience\n([\s\S]*?)(?=\n## |$)/);
  if (!expMatch) return '';

  const expContent = expMatch[1];
  
  // Parse each job - split by h3 headings
  const jobs = expContent.split(/\n### /).filter(j => j.trim() && j.trim() !== '---');
  
  const jobsHTML = jobs.map(job => {
    const lines = job.split('\n').filter(l => l.trim() && l.trim() !== '---');
    const title = lines[0].replace(/^### /, '');
    const companyDate = marked.parseInline(lines[1].trim());
    
    // Find description (first paragraph after company-date)
    let description = '';
    let bullets = [];
    let inBullets = false;
    let techSection = '';
    
    for (let i = 2; i < lines.length; i++) {
      const line = lines[i].trim();
      
      if (line.startsWith('**Key Responsibilities') || line.startsWith('**Leadership')) {
        inBullets = true;
        continue;
      }
      
      if (line.startsWith('**Technologies')) {
        // Extract tech section and parse markdown
        const rawTech = line.replace(/^\*\*Technologies[^:]*:\*\*/, '').trim();
        techSection = marked.parseInline(rawTech);
        continue;
      }
      
      if (line.startsWith('* ')) {
        inBullets = true;
        // Parse markdown in bullet content
        const bulletContent = marked.parseInline(line.substring(2));
        bullets.push(bulletContent);
      } else if (!inBullets && line && !line.startsWith('**')) {
        description += (description ? ' ' : '') + line;
      }
    }
    
    // Parse markdown in description
    if (description) {
      description = marked.parseInline(description);
    }
    
    const bulletsHTML = bullets.length > 0 ? `
                        <ul>
                            ${bullets.map(b => `<li>${b}</li>`).join('\n                            ')}
                        </ul>` : '';
    
    const techHTML = techSection ? `
                        <p style="margin-top: 10px;"><strong>Technologies:</strong> ${techSection}</p>` : '';
    
    return `
                    <div class="experience-item">
                        <div class="job-title">${title}</div>
                        <div class="company-date">${companyDate}</div>
                        <p>${description}</p>${bulletsHTML}${techHTML}
                    </div>`;
  }).join('');

  return `
                <section id="experience" class="animate-in">
                    <h2>Professional Experience</h2>${jobsHTML}
                </section>`;
}

// ============================================================================
// ACHIEVEMENTS PARSER
// ============================================================================

function parseAchievements(markdown) {
  const achMatch = markdown.match(/## Key Achievements\n([\s\S]*?)(?=\n## |$)/);
  if (!achMatch) return '';

  const bullets = achMatch[1]
    .split('\n')
    .filter(line => line.trim().startsWith('*'))
    .map(line => {
      const content = line.trim().substring(2);
      return marked.parseInline(content);
    });

  return `
                <section id="achievements" class="animate-in">
                    <h2>Key Achievements</h2>
                    <div class="experience-item">
                        <ul>
                            ${bullets.map(b => `<li>${b}</li>`).join('\n                            ')}
                        </ul>
                    </div>
                </section>`;
}

// ============================================================================
// EDUCATION PARSER
// ============================================================================

function parseEducation(markdown) {
  const eduMatch = markdown.match(/## Education\n([\s\S]*?)(?=\n## |$)/);
  if (!eduMatch) return '';

  const items = eduMatch[1]
    .split(/\n\*/)
    .filter(item => item.trim() && item.trim() !== '---')
    .map(item => {
      const lines = item.trim().split('\n').filter(l => l.trim() && l.trim() !== '---');
      // First line has institution in **bold**
      const institutionRaw = lines[0].replace(/^\* \*\*/, '').replace(/\*\*$/, '');
      const institution = marked.parseInline(institutionRaw);
      
      // Second line has degree and year
      const details = lines[1] ? marked.parseInline(lines[1].trim()) : '';
      
      return `
                    <div class="education-item">
                        <div class="degree">${details}</div>
                        <div class="institution">${institution}</div>
                    </div>`;
    });

  return `
                <section id="education" class="animate-in">
                    <h2>Education</h2>${items.join('')}
                </section>`;
}

// ============================================================================
// SUMMARY PARSER
// ============================================================================

function parseSummary(markdown) {
  const summaryMatch = markdown.match(/## Professional Summary\n([\s\S]*?)(?=\n## |$)/);
  if (!summaryMatch) return '';

  const paragraphs = summaryMatch[1]
    .split('\n\n')
    .filter(p => p.trim())
    .filter(p => p.trim() !== '---')  // Filter out horizontal rules
    .map((p, idx) => {
      const style = idx > 0 ? ' style="margin-top: 15px;"' : '';
      // Parse markdown inline formatting (bold, italic, links)
      const parsed = marked.parseInline(p.trim());
      return `<p${style}>${parsed}</p>`;
    })
    .join('\n                        ');

  return `
                <section id="summary" class="animate-in">
                    <h2>Professional Summary</h2>
                    <div class="summary">
                        ${paragraphs}
                    </div>
                </section>`;
}

// ============================================================================
// MAIN BUILD FUNCTION
// ============================================================================

async function buildHTML() {
  try {
    const profileName = process.argv[2] || null;
    console.log('📖 Loading files...');
    const metadata = loadMetadata(profileName);
    const markdown = fs.readFileSync('complete-profile.md', 'utf8');
    const template = fs.readFileSync('template.html', 'utf8');

    console.log('🔨 Building HTML sections...');
    
    // Generate each section
    const header = generateHeader(metadata);
    const navigation = generateNavigation(metadata);
    const summary = parseSummary(markdown);
    const skills = generateSkills(metadata);
    const experience = parseExperience(markdown, metadata);
    const projects = generateProjects(metadata);
    const achievements = parseAchievements(markdown);
    const education = parseEducation(markdown);

    // Combine all sections
    const content = `${header}

            <!-- Main Content -->
            <div class="content">${summary}
${skills}
${experience}
${projects}
${achievements}
${education}
            </div>

            <!-- Footer -->
            <footer class="footer">
                <p>Last updated: February 2026 | <a href="complete-profile.md" style="color: var(--primary-color);">View complete profile (Markdown)</a></p>
                <p>© 2025 ${metadata.header.name}. All rights reserved.</p>
            </footer>`;

    // Inject into template
    let finalHTML = template.replace('<!-- CONTENT_PLACEHOLDER -->', content);
    
    // Update SEO metadata
    finalHTML = finalHTML.replace(
      '<title>Văn Minh Huy | Fullstack Software Engineer</title>',
      `<title>${metadata.header.name} - ${metadata.header.title}</title>
    <meta name="description" content="${metadata.seo.description}">
    <meta name="keywords" content="${metadata.seo.keywords}">
    <meta name="author" content="${metadata.seo.author}">`
    );

    // Update navigation
    finalHTML = finalHTML.replace(
      /<div class="nav-links">[\s\S]*?<\/div>/,
      navigation
    );

    // Write output — named after profile
    const outFile = profileName ? `${profileName}.html` : 'index.html';
    fs.writeFileSync(outFile, finalHTML, 'utf8');

    console.log(`✅ Successfully built ${outFile}`);
    console.log('📊 Generated sections:');
    console.log('   - Header with styled contact info');
    console.log('   - Professional Summary');
    console.log('   - Technical Skills (with icons and cards)');
    console.log('   - Professional Experience (with styled formatting)');
    console.log('   - Featured Projects (AI/Automation + Mobile)');
    console.log('   - Key Achievements');
    console.log('   - Education');
    
  } catch (error) {
    console.error('❌ Build failed:', error);
    process.exit(1);
  }
}

buildHTML();
