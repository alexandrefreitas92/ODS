const customHref = function(link){

        // find all links
        const links = document.getElementsByTagName("a");

        // since it returns an object, iterate over each entries
        Object.entries(links).forEach( (elem, i) => {

                // match data-value attribute with input var
                if(elem[1].getAttribute("data-value") === link){

                        // if match, click link
                        elem[1].click()
                }
        });
}

window.smoothScroll = function(target) {
    var scrollContainer = target;
    do { //find scroll container
        scrollContainer = scrollContainer.parentNode;
        if (!scrollContainer) return;
        scrollContainer.scrollTop += 1;
    } while (scrollContainer.scrollTop == 0);

    var targetY = 0;
    do { //find the top of target relatively to the container
        if (target == scrollContainer) break;
        targetY += target.offsetTop;
    } while (target = target.offsetParent);

    scroll = function(c, a, b, i) {
        i++; if (i > 30) return;
        c.scrollTop = a + (b - a) / 30 * i;
        setTimeout(function(){ scroll(c, a, b, i); }, 20);
    }
    // start scrolling
    scroll(scrollContainer, scrollContainer.scrollTop, targetY, 0);
}


$("ods1_button").click(function() {
    $('html,body').animate({
        scrollTop: $("ods_table").offset().top},
        'slow');
});

