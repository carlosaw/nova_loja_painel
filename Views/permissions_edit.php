<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
    Permissões
  </h1>
</section>

<!-- Main content -->
<section class="content container-fluid">

  <form method="POST" action="<?php echo BASE_URL; ?>permissions/edit_action/<?php echo $permission_id; ?>">
    <div class="box">
      <div class="box-header">
        <h3 class="box-title">Editar Grupo de Permissão</h3>
        <div class="box-tools">
          <input type="submit" class="btn btn-success" value="Salvar" />
        </div>
      </div>
      <div class="box-body">

        <div class="form-group">
          <div class="form-group <?php echo (in_array('name', $errorItems))?'has-error':''; ?>">
            <label for="group_name">Nome do Grupo</label>
            <input type="text" class="form-control" id="group_name" name="name"
              value="<?php echo $permission_group_name; ?>" />
          </div>
        </div>
        <hr />

        
          <?php foreach($permission_items as $item): ?>
                                  
              <div class="form-group">              
                <input 
                  <?php 
                    if(in_array($item['slug'], $permission_group_slugs)){
                      echo 'checked="checked"';
                    }                
                  ?>
                  
                  type="checkbox" name="items[]" value="<?php echo $item['id']; ?>"
                  id="item-<?php echo $item['id']; ?>"                
                />              
                <label for="item-<?php echo $item['id']; ?>"><?php echo $item['name']; ?></label>                
              </div>            
          <?php endforeach; ?>

      </div>
    </div>
  </form>
</section>
<!-- 
<?php foreach($permission_group_groups as $group): ?>                     
  <?php // Evita Super Admin excluir 'permissions_view
    if(in_array($permission_group_name==='Super Administrador' && $item['slug']==='permissions_view', $permission_group_groups)) {
      echo 'disabled="disabled"';
    }
  ?>                    
<?php endforeach; ?>  
/.content -->