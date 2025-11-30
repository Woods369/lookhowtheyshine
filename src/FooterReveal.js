// src/footer-reveal.js
class FooterReveal {
    constructor() {
        this.footer = document.querySelector('.footer');
        this.init();
    }

    init() {
    if (!this.footer) {
        console.warn('FooterReveal: No footer element found');
        return;
    }

    this.setupIntersectionObserver();
    }

    setupIntersectionObserver() {
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
        if (entry.isIntersecting) {
            this.animateIn();
        }
        });
    }, { threshold: 0.1 });

    observer.observe(this.footer);
    }

    animateIn() {
    if (typeof gsap !== 'undefined') {
        gsap.fromTo(this.footer, 
        { y: 50, opacity: 0 },
        { y: 0, opacity: 1, duration: 0.8, ease: "power2.out" }
        );
    }
    }
}