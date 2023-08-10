/**
 * market.js
 */

 function validate_price(price){
	 var pattern = new RegExp(/^[0-9]*$/g);
	 return pattern.test(price);
 }