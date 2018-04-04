document.addEventListener("turbolinks:load", function () {
    $input = $("#main_page_search");
    var options = {
        getValue:   "name",
        url: function (phrase) {
            return "/autocomplete.json?q="  +   phrase
        },
        categories: [
            {
                listLocation:   "articles"
            }
        ],
        list: {
                onChooseEvent:  function () {
                    var url = $input.getSelectedItemData().url;
                    Turbolinks.visit(url);
                }
        }
    }
    $input.easyAutocomplete(options)
})