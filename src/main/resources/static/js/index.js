

    //Added the background-Color of each dd when the mouse click on it.
    //但是有個BUG: 會有藍綠色片刻出現!
    //function changeDdColor(id) {
    //document.getElementById(id).style.backgroundColor = "rgb(215,120,120)";
//}

//TEST: 母版页的触发事件:
//     let testBtn = document.getElementById("list5_font1");
//     testBtn.addEventListener('click', function (){
//         alert('I am work');
//     })


    //Changed the Font-Color and Icon-Color of each <li> tag in the nav bar to white.
    function changeColor(id1, id2, list) {
        document.getElementById(id1).style.color = "#fff";
        document.getElementById(id2).style.color = "#fff";
        $(list).show();
    }


    /** When click to other positions of the window screen, recover the Font-Color
     * and Icon-Color to red. 分成了多种情况，比较累赘，但目前没其他方法了...
     * **/
    //classTag1:
    var container = document.getElementsByClassName('nav_parent')[0];
    document.addEventListener('click', function (event) {
    if (container !== event.target && !container.contains(event.target)) {
    console.log('clicking outside the div');
    document.getElementById("change_icon1").style.color = "rgb(183,60,78)";
    document.getElementById("change_text1").style.color = "rgb(183,60,78)";

} else {
    //collapse other <li> tags
    console.log('I am clicking first li');
    //document.getElementById("list2").style.display='none';
    $("#list2").hide();
    $("#list3").hide();
    $("#list4").hide();
    $("#list5").hide();
}
});

    //classTag2:
    var container2 = document.getElementsByClassName('nav_parent')[1];
    document.addEventListener('click', function (event) {

    if (container2 !== event.target && !container2.contains(event.target)) {
    console.log('clicking outside the div');

    document.getElementById("change_icon2").style.color = "rgb(183,60,78)";
    document.getElementById("change_text2").style.color = "rgb(183,60,78)";

} else {
    //collapse other <li> tags
    console.log('I am clicking first li');
    //document.getElementById("list2").style.display='none';
    $("#list1").hide();
    $("#list3").hide();
    $("#list4").hide();
    $("#list5").hide();
}
});

    //classTag3:
    var container3 = document.getElementsByClassName('nav_parent')[2];
    document.addEventListener('click', function (event) {
    if (container3 !== event.target && !container3.contains(event.target)) {
    console.log('clicking outside the div');
    document.getElementById("change_icon3").style.color = "rgb(183,60,78)";
    document.getElementById("change_text3").style.color = "rgb(183,60,78)";

} else {
    //collapse other <li> tags
    console.log('I am clicking first li');
    //document.getElementById("list2").style.display='none';
    $("#list2").hide();
    $("#list1").hide();
    $("#list4").hide();
    $("#list5").hide();
}
});

    //classTag4:
    var container4 = document.getElementsByClassName('nav_parent')[3];
    document.addEventListener('click', function (event) {
    if (container4 !== event.target && !container4.contains(event.target)) {
    console.log('clicking outside the div');
    document.getElementById("change_icon4").style.color = "rgb(183,60,78)";
    document.getElementById("change_text4").style.color = "rgb(183,60,78)";

} else {
    //collapse other <li> tags
    console.log('I am clicking first li');
    //document.getElementById("list2").style.display='none';
    $("#list2").hide();
    $("#list3").hide();
    $("#list1").hide();
    $("#list5").hide();
}
});

    //classTag5:
    var container5 = document.getElementsByClassName('nav_parent')[4];
    document.addEventListener('click', function (event) {
    if (container5 !== event.target && !container5.contains(event.target)) {
    console.log('clicking outside the div');
    document.getElementById("change_icon5").style.color = "rgb(183,60,78)";
    document.getElementById("change_text5").style.color = "rgb(183,60,78)";

} else {
    //collapse other <li> tags
    console.log('I am clicking first li');
    //document.getElementById("list2").style.display='none';
    $("#list2").hide();
    $("#list3").hide();
    $("#list4").hide();
    $("#list1").hide();
}
});
//
//
//     var nav = document.querySelector('.my_nav');
//     nav.addEventListener('toggle', function (event) {
//
//     // Only run if the dropdown is open
//     if (!event.target.open) return;
//
//     // Get all other open dropdowns and close them
//     var dropdowns = nav.querySelectorAll('.show_one[open]');
//     Array.prototype.forEach.call(dropdowns, function (dropdown) {
//     if (dropdown === event.target) return;
//     dropdown.removeAttribute('open');
// });
//
// }, true);


