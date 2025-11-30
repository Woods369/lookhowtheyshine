// build.js - Simple file concatenator
const fs = require('fs');
const path = require('path');

const files = [
    './src/GSAP.js',
    './src/FooterReveal.js', 
    './src/MenuDropdown.js',
    './app.js'
];

const output = files.map(file => {
    return fs.readFileSync(path.join(__dirname, file), 'utf8');
}).join('\n\n');

fs.writeFileSync('./assets/app.js', output);
console.log('Build complete!');