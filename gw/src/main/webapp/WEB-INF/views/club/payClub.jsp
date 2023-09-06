<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
var IMP = window.IMP;
IMP.init('imp73002547');
IMP.request_pay({
    pg : 'inicis',
    pay_method : 'card', //카드결제
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '동호회 가입 및 회비 결제',
    amount : 10000, //판매가격
    buyer_email : '구매자 아이디',
    buyer_name : '구매자 이름',
    buyer_tel : '연락처',
    buyer_addr : '주소',
    buyer_postcode : '우편번호'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
           
        pay_info(rsp);
        
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += 'error : ' + rsp.error_msg;
        
        location.href="goods_pay_fail.do?error_msg="+rsp.error_msg;
    }
});
</script>	
		<div class="card mb-3">
            <div class="card-body">
              <div class="row flex-between-center">
                <div class="col-md">
                  <h5 class="mb-2 mb-md-0">동호회비 결제</h5>
                </div>
                <div class="col-auto">
                  <button class="btn btn-falcon-default btn-sm me-2" role="button">저장</button>
                </div>
              </div>
            </div>
          </div>
          <div class="row g-3 mb-3">
              <div class="card ">
                <div class="card-header">
                  <h5 class="mb-0">카드 정보</h5>
                </div>
                <div class="card-body bg-light">
                  <div class="form-check mb-0">
                    <input class="form-check-input" type="radio" value="" id="credit-card" checked="checked" name="billing" />
                    <label class="form-check-label d-flex align-items-center mb-0" for="credit-card"><span class="fs-1 text-nowrap">Credit Card</span><img class="d-none d-sm-inline-block ms-2 mt-lg-0" src="../../assets/img/icons/icon-payment-methods.png" height="20" alt="" />
                    </label>
                  </div>
                  <p class="fs--1 mb-4">Safe money transfer using your bank accounts. Visa, master, american express.</p>
                  <div class="row gx-3 mb-3">
                    <div class="col">
                      <label class="form-label ls text-uppercase text-600 fw-semi-bold mb-0 fs--1" for="cardNumber">Card Number</label>
                      <input class="form-control" id="cardNumber" placeholder="XXXX XXXX XXXX XXXX" type="text" />
                    </div>
                    <div class="col">
                      <label class="form-label ls text-uppercase text-600 fw-semi-bold mb-0 fs--1" for="cardName">Name of Card</label>
                      <input class="form-control" id="cardName" placeholder="John Doe" type="text" />
                    </div>
                  </div>
                  <div class="row gx-3">
                    <div class="col-6 col-sm-3">
                      <label class="form-label ls text-uppercase text-600 fw-semi-bold mb-0 fs--1" for="inputCountry">Country</label>
                      <input class="form-select mb-3" id="inputCountry" aria-label="customSelectCountry" list="country-list" placeholder="Country" />
                      <datalist class="scrollbar" id="country-list">
                        <option>Afghanistan</option>
                        <option>Albania</option>
                        <option>Algeria</option>
                        <option>American Samoa</option>
                        <option>Andorra</option>
                        <option>Angola</option>
                        <option>Anguilla</option>
                        <option>Antarctica</option>
                        <option>Antigua and Barbuda</option>
                        <option>Argentina</option>
                        <option>Armenia</option>
                        <option>Aruba</option>
                        <option>Australia</option>
                        <option>Austria</option>
                        <option>Azerbaijan</option>
                        <option>Bahamas</option>
                        <option>Bahrain</option>
                        <option>Bangladesh</option>
                        <option>Barbados</option>
                        <option>Belarus</option>
                        <option>Belgium</option>
                        <option>Belize</option>
                        <option>Benin</option>
                        <option>Bermuda</option>
                        <option>Bhutan</option>
                        <option>Bolivia</option>
                        <option>Bosnia and Herzegowina</option>
                        <option>Botswana</option>
                        <option>Bouvet Island</option>
                        <option>Brazil</option>
                        <option>British Indian Ocean Territory</option>
                        <option>Brunei Darussalam</option>
                        <option>Bulgaria</option>
                        <option>Burkina Faso</option>
                        <option>Burundi</option>
                        <option>Cambodia</option>
                        <option>Cameroon</option>
                        <option>Canada</option>
                        <option>Cape Verde</option>
                        <option>Cayman Islands</option>
                        <option>Central African Republic</option>
                        <option>Chad</option>
                        <option>Chile</option>
                        <option>China</option>
                        <option>Christmas Island</option>
                        <option>Cocos (Keeling) Islands</option>
                        <option>Colombia</option>
                        <option>Comoros</option>
                        <option>Congo</option>
                        <option>Congo, the Democratic Republic of the</option>
                        <option>Cook Islands</option>
                        <option>Costa Rica</option>
                        <option>Cote d'Ivoire</option>
                        <option>Croatia (Hrvatska)</option>
                        <option>Cuba</option>
                        <option>Cyprus</option>
                        <option>Czech Republic</option>
                        <option>Denmark</option>
                        <option>Djibouti</option>
                        <option>Dominica</option>
                        <option>Dominican Republic</option>
                        <option>East Timor</option>
                        <option>Ecuador</option>
                        <option>Egypt</option>
                        <option>El Salvador</option>
                        <option>Equatorial Guinea</option>
                        <option>Eritrea</option>
                        <option>Estonia</option>
                        <option>Ethiopia</option>
                        <option>Falkland Islands (Malvinas)</option>
                        <option>Faroe Islands</option>
                        <option>Fiji</option>
                        <option>Finland</option>
                        <option>France</option>
                        <option>France Metropolitan</option>
                        <option>French Guiana</option>
                        <option>French Polynesia</option>
                        <option>French Southern Territories</option>
                        <option>Gabon</option>
                        <option>Gambia</option>
                        <option>Georgia</option>
                        <option>Germany</option>
                        <option>Ghana</option>
                        <option>Gibraltar</option>
                        <option>Greece</option>
                        <option>Greenland</option>
                        <option>Grenada</option>
                        <option>Guadeloupe</option>
                        <option>Guam</option>
                        <option>Guatemala</option>
                        <option>Guinea</option>
                        <option>Guinea-Bissau</option>
                        <option>Guyana</option>
                        <option>Haiti</option>
                        <option>Heard and Mc Donald Islands</option>
                        <option>Holy See (Vatican City State)</option>
                        <option>Honduras</option>
                        <option>Hong Kong</option>
                        <option>Hungary</option>
                        <option>Iceland</option>
                        <option>India</option>
                        <option>Indonesia</option>
                        <option>Iran (Islamic Republic of)</option>
                        <option>Iraq</option>
                        <option>Ireland</option>
                        <option>Israel</option>
                        <option>Italy</option>
                        <option>Jamaica</option>
                        <option>Japan</option>
                        <option>Jordan</option>
                        <option>Kazakhstan</option>
                        <option>Kenya</option>
                        <option>Kiribati</option>
                        <option>Korea, Democratic People's Republic of</option>
                        <option>Korea, Republic of</option>
                        <option>Kuwait</option>
                        <option>Kyrgyzstan</option>
                        <option>Lao, People's Democratic Republic</option>
                        <option>Latvia</option>
                        <option>Lebanon</option>
                        <option>Lesotho</option>
                        <option>Liberia</option>
                        <option>Libyan Arab Jamahiriya</option>
                        <option>Liechtenstein</option>
                        <option>Lithuania</option>
                        <option>Luxembourg</option>
                        <option>Macau</option>
                        <option>Macedonia, The Former Yugoslav Republic of</option>
                        <option>Madagascar</option>
                        <option>Malawi</option>
                        <option>Malaysia</option>
                        <option>Maldives</option>
                        <option>Mali</option>
                        <option>Malta</option>
                        <option>Marshall Islands</option>
                        <option>Martinique</option>
                        <option>Mauritania</option>
                        <option>Mauritius</option>
                        <option>Mayotte</option>
                        <option>Mexico</option>
                        <option>Micronesia, Federated States of</option>
                        <option>Moldova, Republic of</option>
                        <option>Monaco</option>
                        <option>Mongolia</option>
                        <option>Montserrat</option>
                        <option>Morocco</option>
                        <option>Mozambique</option>
                        <option>Myanmar</option>
                        <option>Namibia</option>
                        <option>Nauru</option>
                        <option>Nepal</option>
                        <option>Netherlands</option>
                        <option>Netherlands Antilles</option>
                        <option>New Caledonia</option>
                        <option>New Zealand</option>
                        <option>Nicaragua</option>
                        <option>Niger</option>
                        <option>Nigeria</option>
                        <option>Niue</option>
                        <option>Norfolk Island</option>
                        <option>Northern Mariana Islands</option>
                        <option>Norway</option>
                        <option>Oman</option>
                        <option>Pakistan</option>
                        <option>Palau</option>
                        <option>Panama</option>
                        <option>Papua New Guinea</option>
                        <option>Paraguay</option>
                        <option>Peru</option>
                        <option>Philippines</option>
                        <option>Pitcairn</option>
                        <option>Poland</option>
                        <option>Portugal</option>
                        <option>Puerto Rico</option>
                        <option>Qatar</option>
                        <option>Reunion</option>
                        <option>Romania</option>
                        <option>Russian Federation</option>
                        <option>Rwanda</option>
                        <option>Saint Kitts and Nevis</option>
                        <option>Saint Lucia</option>
                        <option>Saint Vincent and the Grenadines</option>
                        <option>Samoa</option>
                        <option>San Marino</option>
                        <option>Sao Tome and Principe</option>
                        <option>Saudi Arabia</option>
                        <option>Senegal</option>
                        <option>Seychelles</option>
                        <option>Sierra Leone</option>
                        <option>Singapore</option>
                        <option>Slovakia (Slovak Republic)</option>
                        <option>Slovenia</option>
                        <option>Solomon Islands</option>
                        <option>Somalia</option>
                        <option>South Africa</option>
                        <option>South Georgia and the South Sandwich Islands</option>
                        <option>Spain</option>
                        <option>Sri Lanka</option>
                        <option>St. Helena</option>
                        <option>St. Pierre and Miquelon</option>
                        <option>Sudan</option>
                        <option>Suriname</option>
                        <option>Svalbard and Jan Mayen Islands</option>
                        <option>Swaziland</option>
                        <option>Sweden</option>
                        <option>Switzerland</option>
                        <option>Syrian Arab Republic</option>
                        <option>Taiwan, Province of China</option>
                        <option>Tajikistan</option>
                        <option>Tanzania, United Republic of</option>
                        <option>Thailand</option>
                        <option>Togo</option>
                        <option>Tokelau</option>
                        <option>Tonga</option>
                        <option>Trinidad and Tobago</option>
                        <option>Tunisia</option>
                        <option>Turkey</option>
                        <option>Turkmenistan</option>
                        <option>Turks and Caicos Islands</option>
                        <option>Tuvalu</option>
                        <option>Uganda</option>
                        <option>Ukraine</option>
                        <option>United Arab Emirates</option>
                        <option>United Kingdom</option>
                        <option>United States</option>
                        <option>United States Minor Outlying Islands</option>
                        <option>Uruguay</option>
                        <option>Uzbekistan</option>
                        <option>Vanuatu</option>
                        <option>Venezuela</option>
                        <option>Vietnam</option>
                        <option>Virgin Islands (British)</option>
                        <option>Virgin Islands (U.S.)</option>
                        <option>Wallis and Futuna Islands</option>
                        <option>Western Sahara</option>
                        <option>Yemen</option>
                        <option>Yugoslavia</option>
                        <option>Zambia</option>
                        <option>Zimbabwe</option>
                      </datalist>
                    </div>
                    <div class="col-6 col-sm-3">
                      <label class="form-label ls text-uppercase text-600 fw-semi-bold mb-0 fs--1" for="zipCode">Zip Code</label>
                      <input class="form-control" id="zipCode" placeholder="1234" type="text" />
                    </div>
                    <div class="col-6 col-sm-3">
                      <label class="form-label ls text-uppercase text-600 fw-semi-bold mb-0 fs--1" for="expDate">Exp Date</label>
                      <input class="form-control" id="expDate" placeholder="15/2024" type="text" />
                    </div>
                    <div class="col-6 col-sm-3">
                      <label class="form-label ls text-uppercase text-600 fw-semi-bold mb-0 fs--1" for="cvv">CVV<span class="ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Card verification value"><span class="fa fa-question-circle"></span></span></label>
                      <input class="form-control" id="cvv" placeholder="123" maxlength="3" pattern="[0-9]{3}" type="text" />
                    </div>
                  </div>
                </div>
              </div>
          </div>
          
          
<%@ include file="../inc/bottom.jsp" %>          