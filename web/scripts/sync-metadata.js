const fs = require('fs');
const yaml = require('js-yaml');

const MD_FILE = 'complete-profile.md';
const PROFILES_DIR = 'profiles';

/**
 * PARSE SKILLS FROM MARKDOWN
 */
function parseSkillsFromMD(content) {
  const skillsMatch = content.match(/## Technical Skills\n([\s\S]*?)(?=\n## |$)/);
  if (!skillsMatch) return null;

  const sections = skillsMatch[1].split(/\n### /).filter(s => s.trim());
  const categories = sections.map(section => {
    const lines = section.split('\n').filter(l => l.trim());
    const title = lines[0].replace(/^### /, '').trim();
    
    // Default icons based on title keywords
    let icon = '🛠️';
    if (title.toLowerCase().includes('frontend')) icon = '🌐';
    if (title.toLowerCase().includes('backend')) icon = '⚙️';
    if (title.toLowerCase().includes('ai')) icon = '🤖';
    if (title.toLowerCase().includes('devops')) icon = '🚀';
    if (title.toLowerCase().includes('programming')) icon = '💻';
    if (title.toLowerCase().includes('tools')) icon = '🛠️';

    const items = lines.slice(1).map(line => {
      const match = line.match(/^\* \*\*(.*?)\*\*: (.*)/);
      if (match) {
        return { label: match[1], content: match[2] };
      }
      return null;
    }).filter(Boolean);

    return { title, icon, items };
  });

  return { categories };
}

/**
 * PARSE PROJECTS FROM MARKDOWN
 */
function parseProjectsFromMD(content) {
  const projectsMatch = content.match(/## Selected Mobile Projects.*\n([\s\S]*?)(?=\n## |$)/);
  if (!projectsMatch) return null;

  const sections = projectsMatch[1].split(/\n### /).filter(s => s.trim());
  const projects = {};

  sections.forEach(section => {
    const lines = section.split('\n').filter(l => l.trim() && l.trim() !== '---');
    const categoryTitle = lines[0].replace(/^### /, '').trim();
    const categoryKey = categoryTitle.toLowerCase().replace(/[^a-z0-9]/g, '_');
    
    const items = [];
    let currentItem = null;

    for (let i = 1; i < lines.length; i++) {
      const line = lines[i].trim();
      
      // Check for project title: **Name** (Tech)
      const titleMatch = line.match(/^\*\*(.*?)\*\* \((.*)\)/);
      if (titleMatch) {
        if (currentItem) items.push(currentItem);
        currentItem = {
          title: titleMatch[1],
          tech: titleMatch[2],
          description: '',
          nda: titleMatch[1].toLowerCase().includes('confidential')
        };
        continue;
      }

      if (currentItem && line && !line.startsWith('* ')) {
        currentItem.description += (currentItem.description ? ' ' : '') + line;
      }
    }
    if (currentItem) items.push(currentItem);

    projects[categoryKey] = {
      title: categoryTitle,
      items: items
    };
  });

  return projects;
}

/**
 * SYNC ALL METADATA FILES
 */
function syncAll() {
  console.log(`📖 Reading ${MD_FILE}...`);
  const mdContent = fs.readFileSync(MD_FILE, 'utf8');
  
  const freshSkills = parseSkillsFromMD(mdContent);
  const freshProjects = parseProjectsFromMD(mdContent);

  const files = fs.readdirSync(PROFILES_DIR).filter(f => f.endsWith('.metadata.yaml'));

  files.forEach(file => {
    const filePath = `${PROFILES_DIR}/${file}`;
    console.log(`🔄 Syncing ${filePath}...`);
    
    const metadata = yaml.load(fs.readFileSync(filePath, 'utf8'));
    
    // Update skills (if they exist in metadata)
    if (metadata.skills) {
      metadata.skills = freshSkills;
    }

    // Update projects
    // For specialized profiles, we might want to keep some manual highlights,
    // but the user asked for "chuẩn từ MD", so we overwrite.
    if (metadata.projects) {
      metadata.projects = freshProjects;
    }

    // Write back
    fs.writeFileSync(filePath, yaml.dump(metadata, { lineWidth: -1 }), 'utf8');
  });

  console.log('✅ All metadata files are now synchronized with complete-profile.md');
}

syncAll();
