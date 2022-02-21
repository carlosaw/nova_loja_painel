<?php

namespace Models;
use \Core\Model;

class Permissions extends Model {

	public function getPermissionGroupName($id_permission) {
		$sql = "SELECT name FROM permission_groups WHERE id = :id";
		$sql = $this->db->prepare($sql);
		$sql->bindValue(':id', $id_permission);
		$sql->execute();

		if($sql->rowCount() > 0) {
			$data = $sql->fetch();

			return $data['name'];
		} else {
			return '';
		}
	}

	public function getPermissionItemName($id_permission) {
		$sql = "SELECT name FROM permission_items WHERE id = :id";
		$sql = $this->db->prepare($sql);
		$sql->bindValue(':id', $id_permission);
		$sql->execute();

		if($sql->rowCount() > 0) {
			$data = $sql->fetch();

			return $data['name'];
		} else {
			return '';
		}
	}

	public function getPermissions($id_permission) {
		$array = array();

		$sql = "SELECT id_permission_item FROM permission_links WHERE id_permission_group = :id_permission";
		$sql = $this->db->prepare($sql);
		$sql->bindValue(':id_permission', $id_permission);
		$sql->execute();

		if($sql->rowCount() > 0) {
			$data = $sql->fetchAll();
			$ids = array();

			foreach($data as $data_item) {
				$ids[] = $data_item['id_permission_item'];
			}
			/*
			print_r($ids);
			exit;
			*/
			$sql = "SELECT slug FROM permission_items WHERE id IN (".implode(',', $ids).")";
			$sql = $this->db->query($sql);

			if($sql->rowCount() > 0) {
				$data = $sql->fetchAll();
				/*
				print_r($data);
				exit;
				*/
				foreach($data as $data_item) {
					$array[] = $data_item['slug'];
				}
			}

		}

		return $array;
	}

	public function getAllGroups() {
		$array = array();

		$sql = "SELECT 
					permission_groups.*,
					(
						select
							count(users.id)
						from users
						where users.id_permission = permission_groups.id
					) as total_users
					FROM permission_groups";
		$sql = $this->db->query($sql);

		if($sql->rowCount() > 0) {
			$array = $sql->fetchAll(\PDO::FETCH_ASSOC);
		}

		return $array;
	}

	public function getAllItems() {
		$array = array();

		$sql = "SELECT * FROM permission_items";//Puxa os items para permissions_add
		$sql = $this->db->query($sql);

		if($sql->rowCount() > 0) {
			$array = $sql->fetchAll(\PDO::FETCH_ASSOC);
		}

		return $array;
	}

	public function getAllLinks() {
		$array = array();
		
		/*$sql = "SELECT * FROM permission_links WHERE permission_links.id_permission_group = 1 AND permission_links.id_permission_item = 2
		";*/
		$sql = "SELECT * FROM permission_links";
		$sql = $this->db->query($sql);

		if($sql->rowCount() > 0) {
			$array = $sql->fetchAll(\PDO::FETCH_ASSOC);
			$check_has_admin = true;
		}
		
		return $array;
	}

	public function editName($new_name, $id) {
		$sql = "UPDATE permission_groups SET name = :name WHERE id = :id";
		$sql = $this->db->prepare($sql);
		$sql->bindValue(':name', $new_name);
		$sql->bindValue(':id', $id);
		$sql->execute();
	}
	
	public function editItemName($new_name, $id) {
		$sql = "UPDATE permission_items SET name = :name WHERE id = :id";
		$sql = $this->db->prepare($sql);
		$sql->bindValue(':name', $new_name);
		$sql->bindValue(':id', $id);
		$sql->execute();
	}

	public function clearLinks($id) {
		$sql = "DELETE FROM permission_links WHERE id_permission_group = :id";
		$sql = $this->db->prepare($sql);
		$sql->bindValue(':id', $id);
		$sql->execute();
	}

	public function deleteGroup($id_group) {

		$sql = "SELECT id FROM users WHERE id_permission = :id_group";
		$sql = $this->db->prepare($sql);
		$sql->bindValue(':id_group', $id_group);
		$sql->execute();

		if($sql->rowCount() === 0) {// Se não achou nenhum usuário no grupo
			// Deleta o link
			$sql = "DELETE FROM permission_links WHERE id_permission_group = :id_group";
			$sql = $this->db->prepare($sql);
			$sql->bindValue(':id_group', $id_group);
			$sql->execute();
			// Deleta o grupo
			$sql = "DELETE FROM permission_groups WHERE id = :id_group";
			$sql = $this->db->prepare($sql);
			$sql->bindValue(':id_group', $id_group);
			$sql->execute();
		}
	}
	
	public function deleteItem($id_item) {

		$sql = "SELECT id FROM permission_links WHERE id_permission_item = :id";
		$sql = $this->db->prepare($sql);
		$sql->bindValue(':id', $id_item);
		$sql->execute();
		//print_r($id_item);exit;
		if($sql->rowCount() === 0) {// Se não achou nenhum usuário no grupo
			// Deleta o link
			$sql = "DELETE FROM permission_links WHERE id_permission_item = :id_item";
			$sql = $this->db->prepare($sql);
			$sql->bindValue(':id_item', $id_item);
			$sql->execute();
			//print_r($id_item);exit;
			// Deleta o grupo
			$sql = "DELETE FROM permission_items WHERE id = :id";
			$sql = $this->db->prepare($sql);
			$sql->bindValue(':id', $id_item);
			$sql->execute();
			//print_r($id_item);exit;
		}
	}

	public function addGroup($name) {
		$sql = "INSERT INTO permission_groups (name) VALUES (:name)";
		$sql = $this->db->prepare($sql);
		$sql->bindValue(':name', $name);
		$sql->execute();

		return $this->db->lastInsertId();
	}

	public function linkItemToGroup($id_group, $id_item) {
		$sql = "INSERT INTO permission_links (id_permission_group, id_permission_item) VALUES (:id_item, :id_group)";
		$sql = $this->db->prepare($sql);				
		$sql->bindValue(':id_group', $id_group);
		$sql->bindValue(':id_item', $id_item);
		$sql->execute();
	}
	
	public function addItem($name, $slug) {
		$sql = "INSERT INTO permission_items (name, slug) VALUES (:name, :slug)";
		$sql = $this->db->prepare($sql);
		$sql->bindValue(':name', $name);
		$sql->bindValue(':slug', $slug);
		$sql->execute();

		return $this->db->lastInsertId();
	}

}