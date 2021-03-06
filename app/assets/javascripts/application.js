// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require turbolinks
//= require_tree .

function removeFlash() {
    if (document.getElementById('alert')) {
        setTimeout(function(){
            var pAlert =  document.getElementById('alert');        
            if (pAlert.innerHTML.length >0) {
                setTimeout(function(){ 
                    pAlert.remove();
                }, 5000);
            }
        },2000);
    }
};

function copyLink() {
    var $temp = $("<input>");
    $("body").append($temp);
    $temp.val($('#short_url').text()).select();
    document.execCommand("copy");
    $temp.remove();
}