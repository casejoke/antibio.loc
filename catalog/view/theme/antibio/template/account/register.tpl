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
  <?php echo $content_top; ?>
  <!-- MAIN CONTENT -->
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
                <?php $class = 'col-sm-9'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-12'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                  <h1 class="text-center"><?php echo $heading_title; ?></h1>
    <div class="row">
      <div class="col-sm-8 col-sm-offset-1">
         <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <div class="row">
              <div class="col-sm-8 col-sm-offset-4">
                <p>1. Если Вы участвовали в мероприятии проекта и получили Индивидуальный Код, пожалуйста, введите его здесь:</p>
              </div>
            </div>
            
              <div class="form-group required">
                <label class="col-sm-4 control-label" for="input-promocode">Промокод</label>
                <div class="col-sm-8">
                  <input type="text" name="promocode" value="<?php echo $promocode; ?>"  id="input-promocode" class="form-control" />
                  <?php if ($error_promocode) { ?>
                    <div class="text-danger"><?php echo $error_promocode; ?></div>
                  <?php } ?>
                </div>
              </div>

            <div class="row">
              <div class="col-sm-8 col-sm-offset-4">
                <p>2. Если Вы участвовали в мероприятии, но не получили код, пожалуйста, напишите нам на <a href="mailto:contact@antibiotik.pro">contact@antibiotik.pro</a> и укажите ФИО, дату и город в котором проходило мепроиятие и мы свяжемся с организаторами.</p>
              </div>
            </div>   

            <div class="form-group required" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
                <label class="col-sm-4 control-label"><?php echo $entry_customer_group; ?></label>
                <div class="col-sm-8">
                  <?php foreach ($customer_groups as $customer_group) { ?>
                  <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                  <div class="radio">
                    <label>
                      <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                      <?php echo $customer_group['name']; ?></label>
                  </div>
                  <?php } else { ?>
                  <div class="radio">
                    <label>
                      <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
                      <?php echo $customer_group['name']; ?></label>
                  </div>
                  <?php } ?>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-4 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                <div class="col-sm-8">
                  <input type="text" name="lastname" value="<?php echo $lastname; ?>"  id="input-lastname" class="form-control" />
                  <?php if ($error_lastname) { ?>
                  <div class="text-danger"><?php echo $error_lastname; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-4 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                <div class="col-sm-8">
                  <input type="text" name="firstname" value="<?php echo $firstname; ?>"  id="input-firstname" class="form-control" />
                  <?php if ($error_firstname) { ?>
                  <div class="text-danger"><?php echo $error_firstname; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-4 control-label" for="input-email"><?php echo $entry_email; ?></label>
                <div class="col-sm-8">
                  <input type="email" name="email" value="<?php echo $email; ?>"  id="input-email" class="form-control" />
                  <?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                <div class="col-sm-8">
                  <input type="tel" name="telephone" value="<?php echo $telephone; ?>"  id="input-telephone" class="form-control" />
                  <?php if ($error_telephone) { ?>
                  <div class="text-danger"><?php echo $error_telephone; ?></div>
                  <?php } ?>
                </div>
              </div>
            
           
         <?php foreach ($custom_fields as $custom_field) { ?>

          <?php if ($custom_field['location'] == 'account') { ?>
            <?php if ($custom_field['type'] == 'select') { ?>
            <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
              <label class="col-sm-4 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-8">
                <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                  <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                  <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>

            <?php if ($custom_field['type'] == 'radio') { ?>
            <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
              <label class="col-sm-4 control-label"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-8">
                <div>
                  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                  <div class="radio">
                    <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                    <label>
                      <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                      <?php echo $custom_field_value['name']; ?></label>
                    <?php } else { ?>
                    <label>
                      <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                      <?php echo $custom_field_value['name']; ?></label>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>
                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>


            <?php if ($custom_field['type'] == 'checkbox') { ?>
            <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
              <label class="col-sm-4 control-label"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-8">
                <div>
                  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                  <div class="checkbox">
                    <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $register_custom_field[$custom_field['custom_field_id']])) { ?>
                    <label>
                      <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                      <?php echo $custom_field_value['name']; ?></label>
                    <?php } else { ?>
                    <label>
                      <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                      <?php echo $custom_field_value['name']; ?></label>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>
                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>

          <?php if ($custom_field['type'] == 'text') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-4 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-8">
              <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"  id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>

          <?php if ($custom_field['type'] == 'textarea') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-4 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-8">
              <textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-4 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-8">
              <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-4 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-8">
              <div class='input-group  date'>
                <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                  <span class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                </span>
                </div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-4 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-8">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
          <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-4 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-8">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>


         
            <div class="form-group required">
              <label class="col-sm-4 control-label" for="input-password"><?php echo $entry_password; ?></label>
              <div class="col-sm-8">
                <input type="password" name="password" value="<?php echo $password; ?>"  id="input-password" class="form-control" />
                <?php if ($error_password) { ?>
                <div class="text-danger"><?php echo $error_password; ?></div>
                <?php } ?>
              </div>
            </div>
          
            <div class="form-group required">
              <label class="col-sm-4 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
              <div class="col-sm-8">
                <input type="password" name="confirm" value="<?php echo $confirm; ?>"  id="input-confirm" class="form-control" />
                <?php if ($error_confirm) { ?>
                <div class="text-danger"><?php echo $error_confirm; ?></div>
                <?php } ?>
              </div>
            </div>
          
               <div class="form-group">
                  <label class="col-sm-4 control-label"><?php echo $entry_newsletter; ?></label>
                  <div class="col-sm-8">
                    <?php if ($newsletter) { ?>
                    <label class="radio-inline">
                      <input type="radio" name="newsletter" value="1" checked="checked" />
                      <?php echo $text_yes; ?></label>
                    <label class="radio-inline">
                      <input type="radio" name="newsletter" value="0" />
                      <?php echo $text_no; ?></label>
                    <?php } else { ?>
                    <label class="radio-inline">
                      <input type="radio" name="newsletter" value="1" />
                      <?php echo $text_yes; ?></label>
                    <label class="radio-inline">
                      <input type="radio" name="newsletter" value="0" checked="checked" />
                      <?php echo $text_no; ?></label>
                    <?php } ?>
                  </div>
                </div>
              
          
          
          

        
         


              <?php if ($text_agree) { ?>
              <div class="form-group">
                <div class="col-xs-offset-3 col-xs-6 col-sm-4 col-sm-offset-4">
                  <div class="pull-right"><?php echo $text_agree; ?>
                    <?php if ($agree) { ?>
                    <input type="checkbox" name="agree" value="1" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="agree" value="1" />
                    <?php } ?>
                    &nbsp;
                    <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-block btn-base" />
                  </div>
                </div>
              </div>
              <?php } else { ?>
              <div class="form-group">
                <div class="col-xs-offset-2 col-xs-8 col-sm-offset-4 col-sm-8  ">
                    <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-block btn-base" />
                </div>
              </div>
        <?php } ?>

      </form>
       
      </div>
    </div>
                  <?php echo $content_bottom; ?>
                </div>

                <?php if ($column_right) { ?>
                  <div class="col-sm-3 ">
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

<!-- /MODULE -->
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<?php echo $content_bottom; ?>

<?php echo $footer; ?>