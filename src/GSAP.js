// src/gsap-manager.js
class GSAP {
    constructor() {
        this.config = {
            defaults: {
            duration: 0.3,
            ease: "power2.out"
            }
        };
        this.setupGlobalAnimations();
    }

    setupGlobalAnimations() {
        gsap.config({
            nullTargetWarn: false
        });
    }

    slideToggle(element, options = {}) {
    return gsap.to(element, {
        height: "auto",
        duration: 0.3,
        ease: "power2.out",
        ...options
    });
    }
}