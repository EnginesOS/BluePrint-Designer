$(document).ready(function() {

  // The function actually applying the offset
  function offsetAnchor() {
      if(location.hash.length !== 0) {
          window.scrollTo(window.scrollX, window.scrollY - 200);
      }
  }

  // This will capture hash changes while on the page
  $(window).on("hashchange", function () {
      offsetAnchor();
  });

  // This is here so that when you enter the page with a hash,
  // it can provide the offset in that case too. Having a timeout
  // seems necessary to allow the browser to jump to the anchor first.
  window.setTimeout(function() {
      offsetAnchor();
  }, 1); // The delay of 1 is arbitrary and may not always work right (although it did in my testing).

})
