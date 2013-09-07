/**
 * This Javascript file is used to add functionality to the home page.
 * 
 * @author Jesse Forrest <jesse@jesseforrest@gmail.com> 
 * @package StackSocial
 * @copyright Copyright (c) 2013
 * @filesource 
 */

/*jslint browser: true, white: true, maxerr: 50, indent: 4, nomen: true, sub: true, */
/*global $: false */
/**
 * On document ready state
 */ 
$(document).ready(function() {
   // If welcome page
   if ($("#welcome_heading").length > 0) {
      $("#welcome_heading").fadeIn(2000);
      $(".twitter_timeline_container").fadeIn(2000);
   }
});
