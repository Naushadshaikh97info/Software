
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>HighChoices</title>
    <link href="image/fevicon.ico" rel="icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="google-translate-customization" content="b41c17633a53136b-6058e739d1af90a8-gb60d4b4ad62f103d-10"></meta>
    <!-- CSS Part Start-->
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css" />
    <link rel="stylesheet" type="text/css" href="css/slideshow.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/colorbox.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/carousel.css" media="screen" />
    <!-- CSS Part End-->
    <!-- JS Part Start-->
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript" src="js/jquery.jcarousel.min.js"></script>
    <script type="text/javascript" src="js/colorbox/jquery.colorbox-min.js"></script>
    <script type="text/javascript" src="js/tabs.js"></script>
    <script type="text/javascript" src="js/jquery.easing-1.3.min.js"></script>
    <script type="text/javascript" src="js/cloud_zoom.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
    <script type="text/javascript" src="js/jquery.dcjqaccordion.js"></script>
    <!-- JS Part End-->
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="main-wrapper">
            <!-- Header Parts Start-->
            <div id="header">
                <!-- Top Right part Links-->
                <div id="language" style="float: right;">
                    <div id="google_translate_element"></div>
                    <script type="text/javascript">
                        function googleTranslateElementInit() {
                            new google.translate.TranslateElement({ pageLanguage: 'en', includedLanguages: 'en,gu,hi', layout: google.translate.TranslateElement.InlineLayout.SIMPLE }, 'google_translate_element');
                        }
                    </script>
                    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
                </div>
                <div id="welcome">
                    <div class="links">
                        <asp:Label ID="lbl_myaccount" runat="server" Visible="false" Text="My Account"></asp:Label>
                        <ul>
                            <li><a href="shoping_cart.aspx">
                                <asp:Label ID="lbl_shopping" runat="server" Visible="false" Text="My Highchoice Cart"></asp:Label></a></li>
                             <li><a href="order_history.aspx">
                                <asp:Label ID="lbl_order_history" runat="server" Visible="false" Text="My Order History"></asp:Label></a></li>
                            <li><a href="Order_Status.aspx">
                                <asp:Label ID="lbl_Order_Status" runat="server" Visible="false" Text="My Order Status"></asp:Label></a></li>
                            <li><a href="checkout.aspx">
                                <asp:Label ID="lbl_checkout" runat="server" Visible="false" Text="Checkout"></asp:Label></a></li>
                            <li><a href="Change_Password.aspx">
                                <asp:Label ID="lbl_changepassword" runat="server" Visible="false" Text="Change Password"></asp:Label></a></li>
                            <br />
                            <li style="margin-left: 2px;"><a style="margin-left: 9px;">
                                <asp:LinkButton ID="lbl_logout" OnClick="lbl_logout_Click" runat="server" Text="Logout"></asp:LinkButton></a></li>
                        </ul>
                    </div>
                    <a href="Login_Form.aspx">
                        <asp:Label ID="lbl_login" runat="server" Text="Login"></asp:Label></a> <a href="Registraion_Form.aspx">
                            <asp:Label ID="lbl_createaccount" runat="server" Text="Create Account"></asp:Label></a>
                </div>
                <div id="logo">
                    <a href="Default.aspx">
                        <img src="image/logo.png" title="ecommerce Html Template" alt="ecommerce Html Template" /></a>
                </div>
                <div id="search">
                    <asp:LinkButton ID="LinkButton1" OnClick="Button1_Click" class="button-search" runat="server"></asp:LinkButton>
                    <asp:TextBox ID="txt_search" runat="server" OnTextChanged="txt_search_TextChanged" TabIndex="1" onblur="if (this.value==''){this.value=Search For a Brand, Product or Specific Item'};"
                        onfocus="if(this.value=='Search For a Brand, Product or Specific Item'){this.value=''};" placeholder="Search For a Brand, Product or Specific Item"></asp:TextBox>
                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" DelimiterCharacters=""
                        Enabled="true" ServicePath="WebService.asmx" MinimumPrefixLength="1" ServiceMethod="Get_product_name"
                        TargetControlID="txt_search">
                    </cc1:AutoCompleteExtender>
                </div>
                <!--Mini Cart Start-->
                <div id="cart">
                    <div class="heading">
                        <h4 style="margin-top: -1px">
                            <a href="shoping_cart.aspx">
                                <img width="32" height="32" alt="small-cart-icon" src="image/cart-bg.png"></a></h4>
                        <a href="shoping_cart.aspx" style="margin-left: -79px;"><span><a href="shoping_cart.aspx">item(s) :</a>
                            &nbsp;&nbsp;<asp:Label ID="lblitem" runat="server" Text="0"></asp:Label>
                            &nbsp;&nbsp;&nbsp; र :
                            <asp:Label ID="lbl_totalamt" runat="server" Text="0"></asp:Label>
                        </span></a>
                    </div>
                </div>
                <!--Mini Cart End-->
            </div>
            <!--Top Navigation Start-->
            <div id="menu">
                <span>Menu</span>
                <ul>
                    <li class="home"><a title="Home" href="Default.aspx"><span>Home</span></a></li>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <li><a href="Category_List.aspx?id=<%#Eval("code") %>"><%#Eval("menuname")%></a>
                                <div>
                                    <ul>
                                        <asp:Repeater ID="Repeater2" runat="server">
                                            <ItemTemplate>
                                                <li><a href="subcategory_list.aspx?id=<%#Eval("code1") %>"><%#Eval("submenu")%></a>
                                                    <div>
                                                        <ul>
                                                            <asp:Repeater ID="Repeater3" runat="server">
                                                                <ItemTemplate>
                                                                    <li><a href="Products_List.aspx?id=<%#Eval("code2") %>"><%#Eval("thirdsubmenu")%></a></li>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </ul>
                                                    </div>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <!--Top Navigation Start-->
            <div id="container">
                <!--Left Part-->
                <div id="column-left">
                    <!--Categories Part Start-->
                    <div class="box">
                        <div class="box-heading">Categories</div>
                        <div class="box-content box-category">
                            <ul id="custom_accordion">
                                <asp:Repeater ID="Repeater3" runat="server">
                                    <ItemTemplate>
                                        <li class="category25"><a class="cuuchild " href="Category_List.aspx?id=<%#Eval("code") %>"><%#Eval("menuname")%></a> <span class="down"></span>
                                            <ul>
                                                <asp:Repeater ID="Repeater4" runat="server">
                                                    <ItemTemplate>
                                                        <li class="category30"><a class="nochild " href="subcategory_list.aspx?id=<%#Eval("code1") %>"><%#Eval("submenu")%></a>
                                                            <span class="down"></span>
                                                            <ul>
                                                                <asp:Repeater ID="Repeater10" runat="server">
                                                                    <ItemTemplate>
                                                                        <li class="category35"><a class="nochild " href="Products_List.aspx?id=<%#Eval("code2") %>"><%#Eval("thirdsubmenu")%></a></li>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </ul>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                    <!--Categories Part End-->
                    <!--Latest Product Start-->
                    <div class="box">

                        <div class="box-heading">Latest Items</div>
                        <div class="box-content">
                            <div class="box-product">
                                <asp:Repeater ID="Repeater6" runat="server">
                                    <ItemTemplate>
                                        <div>
                                            <div class="image">
                                                <a href="Product_Discription.aspx?id=<%#Eval("code") %>">
                                                    <img src='<%#Eval("p_img") %>' alt="Chair Swing" height="80px" width="80px" /></a>
                                            </div>
                                            <div class="name"><a href="Product_Discription.aspx?id=<%#Eval("code") %>"><%#Eval("p_name") %></a></div>
                                            <div class="price">र<%#Eval("p_price") %></div>

                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                    <!--Latest Product End-->

                </div>
                <!--Left End-->
                <!--Middle Part Start-->
                <div id="content">
                    <%--   <p class="welcome">" The clean and modern look allows you to&nbsp; use the theme for every kind of eCommerce online shop. Great Looks on Desktops, Tablets and Mobiles."</p>--%>
                    <!--Slideshow Part Start-->

                    <div class="slider-wrapper">
                    
                        <div id="slideshow" class="nivoSlider">
                            <asp:Repeater ID="Repeater7" runat="server">
                                <ItemTemplate>
                                    <a href="#<%#Eval("code") %>">
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("slider_img") %>'></asp:Image>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    
                    </div>

                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#slideshow').nivoSlider();
                        });
                    </script>
                    <!--Slideshow Part End-->   
                    <!--Featured Product Part Start-->
                   <div class="box">
                        <div class="box-heading">Categories Collections</div>
                        <div class="box-content">
                            <div class="box-product">
                                <asp:Repeater ID="Repeater8" runat="server">
                                    <ItemTemplate>
                                        <div style="min-width:290px;">
                                            <div class="image">
                                                <a href="Category_List.aspx?id=<%#Eval("code") %>">
                                                    <img src='<%#Eval("p_img") %>' alt="iPhone" height="135px" width="285px" /></a>
                                            </div>
                                            <div class="name" style="font-weight:bold;"><a  href="Category_List.aspx?id=<%#Eval("code") %>"><%#Eval("p_name") %></a></div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="box-heading">Featured Collections</div>
                        <div class="box-content">
                            <div class="box-product">
                                <asp:Repeater ID="GridView1" runat="server">
                                    <ItemTemplate>
                                        <div>
                                            <div class="image">
                                                <a href="Product_Discription.aspx?id=<%#Eval("code") %>">
                                                    <img src='<%#Eval("p_img") %>' alt="iPhone" height="135px" width="135px" /></a>
                                            </div>
                                            <div class="name"><a href="Product_Discription.aspx?id=<%#Eval("code") %>"><%#Eval("p_name") %></a></div>
                                            <div class="price">र<%#Eval("p_price") %> </div>

                                            <div class="cart">
                                                <a class="button" href="Product_Discription.aspx?id=<%#Eval("code") %>">BUY</a>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="box-heading">Most Popular Items</div>
                        <div class="box-content">
                            <div class="box-product">
                                <asp:Repeater ID="Repeater5" runat="server">
                                    <ItemTemplate>
                                        <div>
                                            <div class="image">
                                                <a href="Product_Discription.aspx?id=<%#Eval("code") %>">
                                                    <img src='<%#Eval("p_img") %>' alt="iPhone" height="135px" width="135px" /></a>
                                            </div>
                                            <div class="name"><a href="Product_Discription.aspx?id=<%#Eval("code") %>"><%#Eval("p_name") %></a></div>
                                            <div class="price">र<%#Eval("p_price") %> </div>

                                            <div class="cart">
                                                <a class="button" href="Product_Discription.aspx?id=<%#Eval("code") %>">BUY</a>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>

                    <!--Featured Product Part End-->
                </div>
                <!--Middle Part End-->
                <div class="clear"></div>
                <div class="social-part">
                    <!--Facebook Fun Box Start-->
                    <div id="facebook">
                        <div class="facebook-inner">
                            <div id="fb-root"></div>
                            <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
                            <div class="fb-like-box" data-href="https://www.facebook.com/pages/hsighchoicescom/1523677831212762" data-width="585" data-show-faces="true" data-stream="false" data-header="false" data-border-color="#fff"></div>
                        </div>
                    </div>
                    <!--Facebook Fun Box End-->
                    <!--Twitter Feeds Box Start-->

                    <!--Twitter Feeds Box End-->
                </div>
            </div>
        </div>
        <!--Footer Part Start-->
        <div id="footer">
            <div class="column">
                <h3>Information</h3>
                <ul>
                    <li><a href="about_us.aspx">About Us</a></li>
                    <li><a href="contact_us.aspx">Contact Us</a></li>
                    <li><a href="faqs.aspx">FAQ's</a></li>
                    <li><a href="privacy_policy.aspx">Privacy Policy</a></li>
                    <li><a href="term_condition.aspx">Terms & Condition</a></li>

                </ul>
            </div>
            <div class="column">
                <h3>My Account</h3>
                <ul>
                    <li><a href="#">My Account</a></li>
                    <li><a href="shoping_cart.aspx">Shopping Cart</a></li>
                    <li><a href="checkout.aspx">Checkout</a></li>

                </ul>
            </div>


            <div class="contact">
                <ul>
                    <li class="address">Second plaza, Delhi, india.</li>
                    <li class="mobile">+91 97899 68330</li>
                    <li class="email"><a>Contact@highchoices.com</a></li>
                    <li class="fax">336-555-0002</li>
                </ul>
            </div>
            <div class="social">
                <a href="https://www.facebook.com/pages/highchoicescom/1523677831212762?ref=hl" target="_blank">
                    <img src="image/facebook.png" alt="Facebook" title="Facebook"></a> <a href="https://twitter.com/#!/#" target="_blank">
                        <img src="image/twitter.png" alt="Twitter" title="Twitter"></a> <a href="https://plus.google.com/u/0/#" target="_blank">
                            <img src="image/googleplus.png" alt="Google+" title="Google+"></a> <a href="http://www.pinterest.com/mukhi_s/fashoin-accessories-you-want/" target="_blank">
                                <img src="image/pinterest.png" alt="Pinterest" title="Pinterest"></a> <a href="#" target="_blank">
                                    <img src="image/rss.png" alt="RSS" title="RSS"></a> <a href="http://www.vimeo.com/#" target="_blank">
                                        <img src="image/vimeo.png" alt="Vimeo" title="Vimeo"></a> <a href="http://www.flickr.com/photos/#" target="_blank">
                                            <img src="image/flickr.png" alt="flickr" title="Flickr"></a> <a href="http://www.youtube.com/#" target="_blank">
                                                <img src="image/youtube.png" alt="YouTube" title="YouTube"></a> <a href="skype:#?call" target="_blank">
                                                    <img src="image/skype.png" alt="skype" title="Skype"></a> <a href="#" target="_blank">
                                                        <img src="image/blogger.png" alt="Blogger" title="Blogger"></a>
            </div>
            <div class="clear"></div>
            <div id="powered">
                <a href="#">HighChoices </a>&copy; 2015
                <div class="payments_types">
                    <img src="image/payment_paypal.png" alt="paypal" title="PayPal">
                    <img src="image/payment_american.png" alt="american-express" title="American Express">
                    <img src="image/payment_2checkout.png" alt="2checkout" title="2checkout">
                    <img src="image/payment_maestro.png" alt="maestro" title="Maestro">
                    <img src="image/payment_discover.png" alt="discover" title="Discover">
                    <img src="image/payment_mastercard.png" alt="mastercard" title="MasterCard">
                    <img src="image/payment_visa.png" alt="visa" title="Visa">
                    <img src="image/payment_sagepay.png" alt="sagepay" title="sagepay">
                    <img src="image/payment_moneybookers.png" alt="moneybookers" title="Moneybookers">
                </div>
            </div>
        </div>
        <!--Footer Part End-->
    </form>
</body>
</html>
