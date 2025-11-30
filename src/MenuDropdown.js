class MenuDropdown {
  constructor() {
    this.dropdowns = [];
    this.init();
  }

  init() {
    const dropdownItems = document.querySelectorAll('.dropdown-item');
    
    if (!dropdownItems.length) {
      console.warn('MenuDropdown: No dropdown items found');
      return;
    }

    dropdownItems.forEach(item => this.setupDropdown(item));
  }

  setupDropdown(item) {
    const toggle = item.querySelector('.dropdown-toggle');
    const items = item.querySelector('.dropdown-items');
    
    if (!toggle || !items) {
      console.warn('MenuDropdown: Invalid dropdown structure', item);
      return;
    }

    // Initialize closed state
    items.classList.add('closed');
    gsap.set(items, { height: 0 });

    toggle.addEventListener('click', (e) => {
      e.preventDefault();
      this.toggleDropdown(items);
    });

    this.dropdowns.push({ toggle, items });
  }

  toggleDropdown(items) {
    const isClosed = items.classList.contains('closed');
    
    if (isClosed) {
      items.classList.remove('closed');
      this.openDropdown(items);
    } else {
      items.classList.add('closed');
      this.closeDropdown(items);
    }
  }

  openDropdown(items) {
    // Set to actual height first, then animate from 0
    gsap.set(items, { height: 'auto' });
    const height = items.offsetHeight;
    gsap.set(items, { height: 0 });
    
    gsap.to(items, {
      height: height,
      duration: 0.3,
      ease: "power2.out",
      onComplete: () => gsap.set(items, { height: 'auto' })
    });
  }

  closeDropdown(items) {
    const height = items.offsetHeight;
    gsap.set(items, { height: height });
    
    gsap.to(items, {
      height: 0,
      duration: 0.3,
      ease: "power2.in"
    });
  }
}