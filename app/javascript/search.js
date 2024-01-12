document.addEventListener('DOMContentLoaded', function() {
  const searchForm = document.getElementById('search-form');
  const searchInput = document.getElementById('search-input');
  let timer;

  searchInput.addEventListener('input', function() {
    clearTimeout(timer);
    timer = setTimeout(function() {
      const query = searchInput.value.trim();
      if (query.length >= 3) {
        searchForm.submit();
      }
    }, 2000);
  });

  searchForm.addEventListener('submit', function(event) {
    event.preventDefault();
    openSearchResults();
  });

  function openSearchResults() {
    const searchQuery = searchInput.value.trim();
    const searchResultsUrl = "/search_results?query=" + encodeURIComponent(searchQuery);
    window.open(searchResultsUrl, '_blank');
  }
});