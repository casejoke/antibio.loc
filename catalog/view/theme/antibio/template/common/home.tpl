<?php echo $header; ?>
<!-- Optional header components (ex: slider) -->
    <div class="pg-opt hidden">
        <div class="container">
            <div class="row">
                <div class="col-xs-6">
                    <h2>Blog</h2>
                </div>
                <div class="col-xs-6">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Blog</a></li>
                        <li class="active">Large grid</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
  
  <!-- MAIN CONTENT -->
  <section class="slice bg-white bb">
        <div class="wp-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12  col-md-8">
                        <?php echo $content_top; ?>
                    </div>
                    <div class="col-sm-12 col-md-4">
                        <div class="col-sm-6 col-md-12">
                       <div class="widget">
                            <form action="" class="sky-form">         
                                <div id="dpInline"></div>
                            </form> 
                        </div>
                        </div>
                        

                        <div class="col-sm-6 col-md-12">
                        <div class="wp-block no-margin">
                          <a href="/article_problem_rezist_jkovlev">
                            <img src="images/prv/magazine/magazine-small-7.jpg" class="img-responsive" alt="">
                            <!-- Caption -->
                            <div class="caption-bottom">
                                <span class="title c-white">ЯКОВЛЕВ С.В. ПРОБЛЕМЫ РЕЗИСТЕНТНОСТИ</span>
                                <span class="subtitle c-white"></span>
                            </div>
                          </a>
                        </div>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
        </div>
    </section>
  <section class="slice bg-white">
      <div class="wp-section">
          <div class="container">
              <div class="row">
                <!-- CONTENT -->
                <?php if ($column_left) { ?>
                  <div class="col-sm-3">
                    <div class="sidebar">
                      <?php echo $column_left; ?>
                    </div>
                  </div>
                <?php } ?>

                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-8'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-12'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                   <!-- Style 1 -->
                        <div class="section-title-wr">
                            <h3 class="section-title left"><span>Последнии лекции и материалы</span></h3>
                         
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="wp-block article grid">
                                    <div class="article-image">
                                        <a href="/article_inhd"> <img src="images/prv/magazine/magazine-small-1.jpg" alt=""></a>
                                        <h4 class="image-title base">Обязательно к прочтению</h4>
                                    </div>
                                    <span class="article-category"></span>
                                    <h3 class="title">
                                        <a href="">Рациональная терапия ИНДП</a>
                                    </h3>
                                    <p>
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="wp-block article grid">
                                    <div class="article-image">
                                        <a href="/article_terapia_infekcii"><img src="images/prv/magazine/magazine-small-2.jpg" alt=""></a>
                                        <h4 class="image-title base">Рекомендуем</h4>
                                    </div>
                                    <span class="article-category"></span>
                                    <h3 class="title">
                                        <a href="/article_terapia_infekcii">Рациональная терапия инфекций в урологии и гинекологии</a>
                                    </h3>
                                    <p>
                                    
                                    </p>
                                </div>
                            </div>
                        </div>
                  <?php echo $content_bottom; ?>
                </div>

                <?php if ($column_right) { ?>
                  <div class="col-sm-4 ">
                    <!-- SIDEBAR -->
                    <div class="sidebar">
                      <?php echo $column_right; ?>
                    </div>
                  </div>
                <?php } ?>
              </div>
          </div>
      </div>
  </section>
 <!-- CLIENTS -->
    <section class="slice bg-white">
        <div class="wp-section">
            <div class="container">
                <div class="section-title-wr">
                    <h3 class="section-title left"><span>Партнеры</span></h3>
                </div>
                <div class="row">
                  <div class="col-md-2 col-sm-4 col-xs-6">
                        <div class="client">
                            <a href="http://nphcd.ru/">
                               <img src="image/catalog/partners/logo_np.png" alt="">
                            </a>
                        </div>
                    </div>
                      <div class="col-md-2 col-sm-4 col-xs-6">
                        <div class="client">
                            <a href="http://www.antimicrob.net/">
                               <img src="image/catalog/partners/al_logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-4 col-xs-6">
                        <div class="client">
                            <a href="http://www.ksma.ru/">
                                <img src="image/catalog/partners/logo-krasnodar.png" alt="">
                            </a>
                        </div>
                    </div>
                     <div class="col-md-2 col-sm-4 col-xs-6">
                        <div class="client">
                            <a href="http://www.ngmu.ru/">
                               <img src="image/catalog/partners/logo-novosib.png" alt="">
                            </a>
                        </div>
                    </div>
                     <div class="col-md-2 col-sm-4 col-xs-6">
                        <div class="client">
                            <a href="http://omsk-osma.ru/">
                                <img src="image/catalog/partners/logo-omsk.png" alt="">
                            </a>
                        </div>
                    </div>
                    
                     <div class="col-md-2 col-sm-4 col-xs-6">
                        <div class="client">
                            <a href="http://www.chelsma.ru/">
                               <img src="image/catalog/partners/logo-ural.png" alt="">
                            </a>
                        </div>
                    </div>
                    
                   
                </div>
            </div>
        </div>
    </section>
    <!-- FOOTER -->




<?php echo $footer; ?>