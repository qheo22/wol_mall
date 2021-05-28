<#macro head>
</#macro>

<#macro content>
</#macro>

<#macro script>
</#macro>

<#macro page>
    <!DOCTYPE html>
    <html xmlns="https://www.w3.org/1999/xhtml" lang="ko-KR" class="">

    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta name="description" content=""/>
        <meta name="author" content="uicyk"/>
        <title>wol_mall | 에 오신것을 환영합니다</title>

        <!--favicon -->
        <link rel="apple-touch-icon" sizes="57x57" href="../assets/ico/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="../assets/ico/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="../assets/ico/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/ico/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="../assets/ico/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../assets/ico/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="../assets/ico/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../assets/ico/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="../assets/ico/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"
              href="./assets/ico/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../assets/ico/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="../assets/ico/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../assets/ico/favicon-16x16.png">
        <link rel="manifest" href="../assets/ico/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="../assets/ico/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">

        <!-- Font Google -->
        <link href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700%7COpen+Sans:300,400,600,700,800%7CRufina:400,700&amp;display=swap"
              rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
              rel="stylesheet">

        <!-- Optional CSS -->
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/css/blog.css">

        <!-- Optional JavaScript -->
        <script src="../assets/js/jquery-3.5.1.min.js"></script>
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/admin.js"></script>
    </head>
    <body>
  <@content/>
        <!-- Footer -->

  <footer class="blog-footer mt-5">
      <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
      <p>
          <a href="#">Back to top</a>
      </p>
  </footer>

  <!-- Footer End -->
    <script type="text/javascript">
        $(document).ready(function () {
        });
    </script>
    <@script/>
    </body>
    </html>
</#macro>