<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<style>

/*footer*/
.footer_btm li p > i {
    margin-right: 8px;
}
.footerWrap{position: relative; background: #353535; width: 100%; z-index: 2;}
.ft_inner {
    width: 95%;
    max-width: 1400px;
    margin: 0 auto;
}
/* footer_top */
.footer_top {
    padding: 30px 0;
    border-bottom: 1px solid #555;
}
.ft_inner {
    display: flex;
    justify-content: space-between;
}
.ft_inner > ul.data-gather {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
}
.ft_inner > ul.data-gather li::after {
    content: "ã£";
    padding: 0 10px;
    color: #595959;
}
.ft_inner > ul.data-gather li:last-of-type::after {
    display: none;
}
.ft_inner a {
    color: #d5d5d5;
}
.ft_inner > ul.data-gather li:first-child a {
    font-weight: 600;
    color: #edd500;
}
.ft_inner > .familyWrap {
    width: 40%;
    max-width: 248px;
    position: relative;
}
.ft_inner > .familyWrap > .faBtn {
    border-radius: 30px;
    border: 1px solid #d5d5d5;
    font-size: 13px;
    display: block;
    transform: rotate(-0.03deg);
    text-indent: 2%;
    width: 100%;
    color: #d5d5d5;
    text-align: left;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-sizing: border-box;
    padding: 0 20px;
    line-height: 2.8;
    cursor: pointer;
}
.ft_inner > .familyWrap > .faBtn p {
    flex: 1;
}
.ft_inner > .familyWrap > .faBtn span img {
    transition: all 300ms ease-in-out;
    vertical-align: super;
}
.ft_inner > .familyWrap .FamilyList {
    position: absolute;
    top: calc(100% + 10px);
    display: none;
    background: #353535;
    color: #d5d5d5;
    border: 1px solid #d5d5d5;
    border-radius: 30px;
    width: 100%;
    padding: 20px 0;
    text-indent: 20px;
    overflow: hidden;
}
.ft_inner > .familyWrap .FamilyList > li {
    line-height: 2.5;
}
.ft_inner > .familyWrap .FamilyList > li:hover {
    background: #242424;
}
/* footer_btm */
.footer_btm {position: relative; padding: 40px 0; max-width: 1400px; margin: 0 auto; display: flex; justify-content: space-between; gap: 100px; width: 95%;}
.footer_btm * { color: #d5d5d5; }
.footer_btm .footer{max-width: 1300px; margin: 0 auto; position: relative;}
.footer_btm .flogo {
    width: fit-content;
}
.footer_btm .fcall { position: relative; transition: color 500ms background-color 500ms; }
.footer_btm .fcall:hover * { color: #eee; }
.footer_btm .fcall:hover::before { background-color: #eee; }
.footer_btm .fcall::before {
    background: #d5d5d5 url(../img/common/f_call.svg) no-repeat center center;
    width: 25px;
    height: 25px;
    background-size: 25px;
    padding: 15px;
    content: "";
    position: absolute;
    left: -70px;
    border-radius: 100%;
}
.footer_btm .fcall p { font-size: 15px; }
.footer_btm .fcall strong { font-size: 28px; font-weight: 600;}
.footer_btm .address { flex: 1; }
.footer_btm .address li {
    display: flex;
    gap: 30px;
    font-size: 15px;
    line-height: 1.8;
}
.footer_btm .address > p { color: #999; }
.footer_menu{
    max-width: 1300px;
    width: 280px;
    height: 40px;
    background: #fff;
    padding: 10px 0;
    border-radius: 9px;
    border: none;
}
.footer_menu .footer_list{ overflow: hidden;}
.footer_menu .footer_list li{float: left;position: relative;padding: 0 16px;}
.footer_menu .footer_list li:first-child { padding-left: 40px; }
.footer_menu .footer_list li:first-child:after{display: none;}
.footer_menu .footer_list li:after {content: '';width: 2px;height: 2px;position: absolute;top: 60%;left: 0px;background: #6c6e74;margin: -4px 0 0; border-radius: 50%;}
.footer_menu .footer_list li:first-child a{color: #000; opacity: 0.8;}
.footer_menu .footer_list li a{display: block;color: #f87b24;letter-spacing: 0;font-size: 1em; font-weight: bold;}
.mft_list{display: none;}
.mft_list .foot_site_menu li a{color: #9c9ea2;}
/* footer_logo */
.footer .logo_m{display: none;}
.footLogo{
    position: absolute;
    bottom: 0;
    left: 0;
}
.footer { display: flex; justify-content: space-between; max-width: 1300px; margin: 0 auto; padding: 30px 0; }
.footer_area{ margin-top: 15px; }
.footer_area .footer_info p{color: #fff;margin-top: 5px;font-weight: 300;font-size: 0.875rem;letter-spacing: -0.025em;}
.footer_area .footer_info p:first-child{ margin-top: 0;}
.footer_area .footer_info p:last-child{ margin-top: 15px; color: #858585; font-size: 0.813rem; }
.footer_link_area { display: flex; flex-direction: column; }
.footer_link_area .footer_sns { display: flex; justify-content: end; margin: 0 0 22px; }
.footer_link_area .footer_sns a { margin-right: 10px; }
.footer_link_area .footer_sns a:last-child { margin-right: 0; }
.footer_link_area form select { background: transparent; border: 1px solid #fff; border-radius: 7px; color: #fff; padding: 13px 50px 13px 15px; }
.footer_link_area form select option { color: #000; }
</style>
</head>
<body>
    <footer id="footer" class="footer">
        <div class="footerWrap" id="footerWrap">
            <div class="footer_top">
                <div class="ft_inner">
                    <ul class="data-gather">
                        <li><a href="/cms/content/view/560" title="개인정보처리방침">개인정보처리방침</a></li>
                        <li><a href="/cms/content/view/548" title="이메일무단수집거부">이메일무단수집거부</a></li>
                        <li><a href="https://www.kofac.re.kr/cms/content/view/491" target="_blank" title="저작권정책">저작권정책/a></li>
                    </ul>
                    <div class="familyWrap">
                        <button class="faBtn"><p>Family Site</p></button>
                        <ul class="FamilyList">
                        <li>
                            <li><a href="https://www.algeomath.kr/main.do" target="_blank" title="test">test1</a></li>
                            <li><a href="https://smart.kofac.re.kr/home/kor/main.do" target="_blank" title="test">test2</a></li>
                            
                        </ul>
                    </div>
                </div> <!-- ft_inner -->
            </div>
            <div class="footer_btm">
                <a href="javascript:void(0)" class="flogo"><img src="/_static/www/img/common/flogo.png" alt="KB큽스쿨"></a>
                <div class="address">
                    <ul>
                        <li><p><i class="fas fa-map-marker-alt"></i>(06621) 서울 서초구 서초대로74길 33 DIGICAMPUS 3ê¸°</p></li>
                        <li><p><i class="fas fa-phone-alt"></i>02-123-4567</p><p><i class="far fa-envelope"></i>ringdingding@dicam.kb</p></li>
                    </ul>
                    <p>Copyright Â© RINGDINGDING. All rights reserved.</p>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
