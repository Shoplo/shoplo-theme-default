@font-face { font-family: 'HelveticaNeue-Bold'; src: url('helveticaneue-webfont.eot'); src: url('helveticaneue-webfont.eot?iefix') format('eot'), url('helveticaneue-webfont.woff') format('woff'), url('helveticaneue-webfont.ttf') format('truetype'); }

a { text-decoration: none; color: {$settings->content_link_color}; }
a:hover {text-decoration: underline; }

.alignLeft { float: left; }
.alignRight { float: right; }
.hide { display: none; }

body { background: {$settings->content_bg_color}; font: normal 13px Helvetica, Arial, Tahoma, Verdana, sans-serif; }
h2, h3 { font-family: Georgia, 'Times New Roman', Times, serif; }
h3 { font-size: 36px; color: #333; }

.ui-selectmenu-icon, .ui-selectmenu, .ui-selectmenu.ui-state-active { background-image: url("icons_sprite.png"); }

.msg p { text-align: center; padding: 0; }
.msg p.success { color: #23AA26; }
.msg p.error { color: #C61919; }

#wrapper { background: #fff; -moz-box-shadow: 0 0 5px rgba(0,0,0,{$settings->shadow_oppacity}); -webkit-box-shadow: 0 0 5px rgba(0,0,0,{$settings->shadow_oppacity}); box-shadow: 0 0 5px rgba(0,0,0,{$settings->shadow_oppacity}); padding: 30px; width: 920px; }
#header .top { margin-bottom: 20px; }
#header .cart a { color: #000; }
#header ul li { width: auto !important; margin-right: 60px; }

#logo { float: left;}
#logo a { margin-bottom: 20px; font-size: 42px; font-family: Georgia, 'Times New Roman', Times, serif; text-decoration: none; color: #000; display: block; }
#logo span { color: #999; font-size: 10px; letter-spacing: 2px; display: block; }
.logo_img {max-width: 300px; max-height: 80px; }

#nav-search { float: right; padding-top: 10px; }
#nav-search input { background: #fafafa; border: 1px solid #f2f2f2; height: 25px; line-height: 25px; display: block; float: left; margin: 0; }
#nav-search input[type=text] { border-right: none; border-radius: 6px 0 0 6px; -moz-border-radius: 6px 0 0 6px; -webkit-border-radius: 6px 0 0 6px; width: 190px; font-size: 16px; padding: 2px 5px; }
#nav-search input[type=submit] { border-left: none; border-radius: 0 6px 6px 0; -moz-border-radius: 0 6px 6px 0; -webkit-border-radius: 0 6px 6px 0; padding: 2px 10px; color: #d8d8d8; font-size: 16px; height: 31px; line-height: 25px; }

.nav { border-top: 1px solid #f2f2f2; border-bottom: 1px solid #f2f2f2; margin-bottom: 24px; }
.nav ul li a { height: 40px; line-height: 40px; text-decoration: none; font-size: 13px; color: #767676; }
.nav ul > li { position:relative; }
.nav ul li.active a { font-weight:bold; color:#000; }
.nav ul li a:hover { color: #444; }
.nav ul li > ul { position:absolute; background:#fff; border-color: #f2f2f2; border-style: solid; border-width: 1px; border-color: #ffffff #f2f2f2 #f2f2f2; box-shadow: 0 1px 1px #f0f0f0; padding: 5px; z-index: 300; width: 150px;}
.nav div { background: url('../assets/cart.jpg') no-repeat scroll 0 11px; height: 40px; line-height: 40px; font-size: 12px; color: #767676; float: right; padding-left: 20px; }
/*** Pagination ***/
ul.pagination { width: 100%; }
ul.pagination li { display: inline-block; font-size: 16px; margin: 0 5px; text-align: center; }
ul.pagination li a { color: #62a0c4; }
ul.pagination li span { color: #ccc; }
ul.pagination li.active span { color: #000; }
ul.pagination li.prev { float: left; margin-left: 0; width: 40%; text-align: left; }
ul.pagination li.next { float: right; margin-right: 0; width: 40%; text-align: right; }

#banner { margin-bottom: 40px; position: relative; }
#banner .viewport { overflow: hidden; width: 920px; height: 390px; background: url(loader.gif) no-repeat center #fff; position: relative; }
#banner .viewport .images { position: relative; }
#banner .viewport li { float: left; }
#banner .prev, #banner .next { display: block; width: 70px; height: 60px; position: absolute; z-index: 1; top: 160px; }
#banner .prev { background: url(banner_prev.png); left: -42px; }
#banner .next { background: url(banner_next.png); right: -42px; }
#banner .pager { text-align: center; padding: 10px 0; }
#banner .pager a { display: inline-block; background: #dadada; -moz-box-shadow: inset 2px 2px 3px #b3b3b3; -webkit-box-shadow: inset 2px 2px 3px #b3b3b3; box-shadow: inset 2px 2px 3px #b3b3b3; width: 10px; height: 10px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; }
#banner .pager a.active { background: #8e8e8e; -moz-box-shadow: inset 2px 2px 3px #747474; -webkit-box-shadow: inset 2px 2px 3px #747474; box-shadow: inset 2px 2px 3px #747474; }
#banner .pager li { display: inline; padding: 0 1px; }
#banner .images li a { display: block; }

/* Home Page Boxes */
.smartBox { width:410px; padding:20px; }
.smartBox h4 { margin-bottom:0px; }
.smartBox p { color:#8A979F; }
.smartBox.newsletter { background: {$settings->newsletter_bg_color}; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; border:1px solid {$settings->newsletter_border_color}; }
.smartBox form input[type=submit] { background:#5AA6D5; -moz-border-radius:15px; -webkit-border-radius:15px; border-radius:15px; color:#fff; font-size:13px; padding:5px 8px; border: 1px solid #289CE0; }
.smartBox form input[type=text] { border:1px solid {$settings->newsletter_border_color}; padding:5px; width:220px; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; }
.productList li { float: left; width: 213px; height: 215px; text-align: center; border: 1px solid #f2f2f2; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; margin-right: 20px; margin-bottom: 20px; }
.productList li.last { margin-right: 0; }
.productList li span { display: block; color: #333; font-size: 13px; }
.productList li span.price { margin-top: 2px; color: #666; } 
.productList li a { padding: 10px; display: block; }
.productList li a div { height: 150px; line-height:150px; margin-bottom: 10px; }
.productList li a div img { max-height: 150px; vertical-align: middle; }

#footer { border-top: 1px solid #f2f2f2; margin-top: 10px; padding-top: 20px; padding-bottom: 20px; }
#footer ul.footerMenu { float: left; width: 430px; }
#footer ul.footerMenu li { text-align: left; width: 145px; padding-left: 0; padding-right: 70px; }
#footer ul.footerMenu li a { color: #7f7f7f; }
#footer ul.services { float: right; background: url('../assets/services_icons.jpg') no-repeat; }
#footer ul.services li { float: left; padding: 0; width: 21px; margin-right: 5px; }
#footer ul.services li a { width: 21; height: 21px; display: block; }

.copyrights { margin: 0 auto; width: 980px; }
.copyrights span { padding: 20px 30px 0; display: inline-block; color: #7f7f7f; }
.copyrights span.alignRight { padding-right: 10px; }
.copyrights .logo { width: 62px; height: 21px; background: url(../assets/footer_logo.png); display: inline-block; vertical-align: middle; }

/*** Product Page ***/
.path { margin-bottom: 30px; color: #888; }
.path li { float: left; font-size: 12px; margin-right: 5px; }

.ad-gallery { width: 400px; float: left; margin-right: 30px; }
#gallery .nav {width: 100%; height: 23px; }
.imageLayout #thumbs { width: 100px !important; float: left; margin-right: 20px; }
.imageLayout .mainImage { float: left; }
.imageLayout .mainImage img { max-width: 280px; }
.imageLayout ul { float: left; width: 100px; height: 330px; }
.imageLayout ul li { margin-bottom: 10px; height: 100px; line-height: 100px; }
.productDescription { float: left; width: 450px; }
div.navigation div.top, div.navigation div.bottom { height: auto !important; }
div.pagination a { margin: 0 auto !important; float: none !important; width: 24px; height: 24px; text-indent: -1000px; overflow: hidden; border: 0 !important; background: url(../assets/photos_nav.png) 0 0 no-repeat; }
div.pagination a:hover { background-color: #fff !important; }
div.pagination.bottom a { background-position: 0 -24px; }
ul.thumbs li a.thumb { display: block; text-align: center; }
ul.thumbs li a.thumb img { display: inline; vertical-align: middle; }

ul.variants li { float: left; width: 145px; margin-right: 5px; }
ul.variants li span { font-weight: bold; display: inline-block; margin-bottom: 5px; }
ul.variants li ul li { margin-bottom: 5px; }
ul.variants li label input { margin: 0 5px; }
.productPage .price { margin: 30px 0; }
.productPage .price span { font-size: 36px; font-family: Georgia, 'Times New Roman', Times, serif; color: #666; float: left; }
.productPage .price span span { float: none; }
.productPage .price input, .cartPage .submit input { background: #93c9e9; color: #fff; text-shadow: 0 -1px 0 #80b9da; border-radius: 15px; -moz-border-radius: 15px; -webkit-border-radius: 15px; font-size: 15px; font-weight: bold; margin: 9px 0 0 15px; padding: 5px 15px; border: 1px solid #80b9da; -moz-box-shadow: 0 1px 0 #acd5ee inset; -webkit-box-shadow: 0 1px 0 #acd5ee inset; box-shadow: 0 1px 0 #acd5ee inset; }
.productPage .price input:hover, .cartPage .submit input:hover { background:#acd5ee; -moz-box-shadow: 0 1px 0 #93c9e9 inset; -webkit-box-shadow: 0 1px 0 #93c9e9 inset; box-shadow: 0 1px 0 #93c9e9 inset; }
.desc p strong { color: #333; }
.desc p { margin: 0; color: #666; margin-bottom: 7px; }
.lack { margin-top: 5px; color: red; }

.nav-controls { display: none; }

.header { margin-top: 60px; }
.header a { color: #529EB8; float: right; }
.header a:hover { text-decoration: underline; }
.nextPrev { text-align: center; }

/*** Category Page ***/
.leftSidebar { float: left; width: 235px; padding-top: 40px; }
.leftSidebar li.main { margin-top: 10px; border-bottom: 1px solid #f3f3f3; padding-bottom: 10px; width: 90%;}
.leftSidebar li.main:last-child { border-bottom: none; }
.leftSidebar li a { color: #529EB8; }
.leftSidebar li.active > a { color:#000; }
.leftSidebar li ul { margin: 5px 0 25px 15px; }
.leftSidebar li ul li { margin: 7px 0; }
.leftSidebar .hr { border-bottom: 1px solid #f3f3f3; width: 90%; margin: 20px 0; }
.container { float: left; width: 685px; }
.container.list { width: 100%; }
.container.list .header { margin-top: 30px; }
.container.list .header span { font-size: 26px; }
.container.list .header span span { color: #989898; }
.container .path { margin-bottom: 20px; }
.container .path li .sep { font-size: 16px; color: #8A8A8A; vertical-align: top; }
.container .path li a, .container .path li span { font-size: 20px; }

/*** Cart Page ***/
.cartPage { margin-bottom: 20px; }
.cartPage .cartItem { border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border: 1px solid #f2f2f2; padding: 10px 20px; margin-bottom: 20px; height: 100px; }
.cartPage .cartItem .col { float: left; }
.cartPage .cartItem .image { margin-right: 20px; width: 100px; height: 100px; line-height: 100px; text-align: center; }
.cartPage .cartItem .image img { vertical-align: middle; }
.cartPage .cartItem .description { width: 450px; line-height: 100px; vertical-align: middle; padding}
.cartPage .cartItem .description p { margin-bottom: 0px; }
.cartPage .cartItem .description p:first-child { padding-top: 35px; font-weight: bold; }
.cartPage .cartItem .quantity { width: 80px; }
.cartPage .cartItem .quantity input { width: 30px; text-align: center; margin-top: 30px; background: #fafafa; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; padding: 5px 10px; display: block; border: 1px solid #f2f2f2; color: #bebebe; font-size: 15px; }
.cartPage .cartItem .price { width: 120px; float: right; text-align: center; }
.cartPage .cartItem .price span { font-size: 20px; color: #333; margin-top: 35px; display: inline-block; }
.cartPage .cartItem .remove { float: right; }
.cartPage .cartItem .remove a { display: block; margin-top: 33px; background: #fafafa; padding: 5px 10px; color: #5799C0; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;}
.cartPage .summary a { color: #5799c0; font-size: 0.9em; }
.cartPage .summary div { color: #5799c0; }
.cartPage .summary div span.price { font-weight: bold; display: inline-block; margin-left: 20px; color: #333; font-size: 25px; padding-right: 65px; }
.cartPage .summary div span.label { font-weight: normal; color: #999; font-size: 25px; }
.cartPage .submit { margin-top: 2px; margin-bottom: 45px; padding-right: 65px; }