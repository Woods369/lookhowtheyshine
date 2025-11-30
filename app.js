// import { GSAPManager } from './components/GSAP.js';
// import { MenuDropdown } from './components/MenuDropdown.js';
// import { FooterReveal } from './components/FooterReveal.js';

class App {
    constructor() {
        this.components = [];
        this.init();
    }

    init() {
    try {
        // Initialize GSAP plugins first
        if (this.checkGSAP()) {
            this.components.push(new GSAP());
        }

        // Initialize UI components
        this.components.push(
            new MenuDropdown(),
            new FooterReveal()
        );

        console.log('App initialized successfully');
    } catch (error) {
        console.error('App initialization failed:', error);
        this.fallbackToBasicFunctionality();
    }
    }

    checkGSAP() {
    if (typeof gsap === 'undefined') {
        console.warn('GSAP not loaded - animations disabled');
        return false;
    }

    if (typeof MorphSVGPlugin !== 'undefined') {
        gsap.registerPlugin(MorphSVGPlugin);
    }

    return true;
    }

    fallbackToBasicFunctionality() {
    document.querySelectorAll('.dropdown-toggle').forEach(toggle => {
        toggle.addEventListener('click', function() {
            const items = this.nextElementSibling;
            if (items && items.classList.contains('dropdown-items')) {
                items.classList.toggle('closed');
                items.style.height = items.classList.contains('closed') ? '0' : 'auto';
            }
        });
    });
    }
}

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => new App());
} else {
    new App();
    
}