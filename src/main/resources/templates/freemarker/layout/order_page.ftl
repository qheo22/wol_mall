<#macro head>
</#macro>

<#macro content>
</#macro>

<#macro script>
</#macro>

<#macro page>
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta name="description" content=""/>
        <meta name="author" content="uicyk"/>
        <title>Wol_mall</title>
        <meta property="og:type" content="website"/>
        <meta property="og:title" content="THE14"/>
        <meta property="og:description" content="the14 Mask Store"/>
        <meta property="og:type" content="website"/>
        <meta name="keywords" content="THE14, 더포틴, Mask">

        <!--favicon -->
        <link rel="apple-touch-icon" sizes="57x57" href="./assets/ico/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="./assets/ico/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="./assets/ico/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="./assets/ico/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="./assets/ico/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="./assets/ico/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="./assets/ico/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="./assets/ico/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="./assets/ico/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"
              href="./assets/ico/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="./assets/ico/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="./assets/ico/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="./assets/ico/favicon-16x16.png">
        <link rel="manifest" href="./assets/ico/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="assets/ico/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">

        <!-- Font Google -->
        <link href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700%7COpen+Sans:300,400,600,700,800%7CRufina:400,700&amp;display=swap"
              rel="stylesheet">

        <!-- Optional CSS -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="../assets/css/common.css" rel="stylesheet"/>

        <!-- Optional JavaScript -->
        <script src="/assets/js/jquery-3.5.1.min.js"></script>
        <script src="/assets/js/bootstrap.bundle.min.js"></script>
        <script src="/assets/js/common.js"></script>
        <script src="/assets/js/order_util.js"></script>
        <script src="/assets/js/modal.js"></script>


        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
        <#import "/spring.ftl" as spring/>

    </head>
    <body>
    <div class="container">
        <header class="blog-header py-3">
            <div class="row flex-nowrap justify-content-between align-items-center">
                <div class="col-4 pt-1">
                    <a class="link-secondary" href="#"></a>
                </div>
                <div class="col-4 text-center">
                    <a class="blog-header-logo text-dark" href="main">wol_mall</a>
                </div>
                <div class="col-4 d-flex justify-content-end align-items-center">
                    <a class="link-secondary" href="/orderSearch" aria-label="Search">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
                    </a>
                    <a class="link-secondary" href="/cart" aria-label="Search">
                        <img src="../assets/img/ic_bag.png" style="width: 20px">
                    </a>
                    <#--                        <a class="btn btn-sm btn-outline-secondary" onclick="location.href='/signUp'">Sign up</a>-->
                </div>
            </div>
            <#--                <input type="button" onclick="location.href='/admin/upload'" value="업로드">-->
        </header>
        <div class="nav-scroller py-1 mb-2">
            <nav class="nav d-flex justify-content-between">
                <a class="p-2 link-secondary" href="/category?type=0">Best</a>
                <#--                    <a class="p-2 link-secondary" href="/category">신상</a>-->
                <a class="p-2 link-secondary" href="/category?type=4">아우터</a>
                <a class="p-2 link-secondary" href="/category?type=3">셔츠</a>
                <a class="p-2 link-secondary" href="/category?type=1">티셔츠</a>
                <a class="p-2 link-secondary" href="/category?type=2">팬츠</a>
            </nav>
        </div>
    </div>


    <#include "../widget/modal.ftl">

    <@content/>
    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="copy text-center">
                <p>&copy; 2021 WolMall All rights reserved.</p>
            </div>
        </div>
    </footer>
    <@script/>
    </body>
    </html>
</#macro>