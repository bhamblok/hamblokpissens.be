function onHashChange() {
  if (location.hash) {
    var menuItem = document.querySelector('.category-nav a.active');
    if (menuItem) {
      menuItem.classList.remove('active');
    }
    var menuItem = document.querySelector('[href="'+location.hash+'"]');
    if (menuItem) {
      menuItem.classList.add('active');
    }
  }
}
window.addEventListener('load', function() {
  window.addEventListener('hashchange', onHashChange);
  onHashChange();
});