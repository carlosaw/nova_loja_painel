<?php
namespace Controllers;

use \Core\Controller;
use \Models\Users;
use \Models\Brands;
use \Models\Categories;
use \Models\Products;
use \Models\Options;
use \Models\Rates;

class ProductsController extends Controller {

	private $user;
	private $arrayInfo;

	public function __construct() {
		$this->user = new Users();

		if(!$this->user->isLogged()) {
			header("Location: ".BASE_URL."login");
			exit;
		}

		if(!$this->user->hasPermission('products_view')) {
			header("Location: ".BASE_URL);
			exit;
		}

		$this->arrayInfo = array(
			'user' => $this->user,
			'menuActive' => 'products',			
		);
	}

	public function index() {
		$products = new Products();

		$this->arrayInfo['list'] = $products->getAll();

		$this->loadTemplate('products', $this->arrayInfo);
	}

	// Adiciona Produto
  public function edit($id) {
		if(!empty($id)) {

			$cat = new Categories();
			$brands = new Brands();
			$options = new Options();
			$products = new Products();
			$rates = new Rates();

			$this->arrayInfo['cat_list'] = $cat->getAll();
			$this->arrayInfo['brands_list'] = $brands->getAll();
			$this->arrayInfo['options_list'] = $options->getAll();

			$this->arrayInfo["errorItems"] = array();

			if(isset($_SESSION['formError']) && count($_SESSION['formError']) > 0) {
				$this->arrayInfo['errorItems'] = $_SESSION['formError'];
				unset($_SESSION['formError']);
			}

			$this->arrayInfo['info'] = $products->get($id);

			$this->arrayInfo['rates'] = $rates->getRatesFromProduct($id);

			$this->loadTemplate("products_edit", $this->arrayInfo);
		}		
	}

	public function edit_action() {
		//echo '<pre>';print_r($_POST);exit;echo '</pre>';
		if(!empty($_POST['id'])) {
			//echo '<pre>';print_r($_POST);exit;echo '</pre>';

			// Pega os dados do produto
			$id = $_POST['id'];
			$id_category = $_POST['id_category'];
			$id_brand = $_POST['id_brand'];
			$name = $_POST['name'];
			$description = $_POST['description'];
			$stock = $_POST['stock'];						
			$price_from = $_POST['price_from'];
			$price = $_POST['price'];			
			/*echo '<pre>';print_r($_POST);exit;echo '</pre>';*/			
			$weight = $_POST['weight'];
			$width = $_POST['width'];
			$height = $_POST['height'];
			$length = $_POST['length'];
			$diameter = $_POST['diameter'];

			$featured = (!empty($_POST['featured']))?1:0;
			$sale = (!empty($_POST['sale']))?1:0;
			$bestseller = (!empty($_POST['bestseller']))?1:0;
			$new_product = (!empty($_POST['new_product']))?1:0;
			//echo '<pre>';print_r($_POST);exit;echo '</pre>';
			$options = $_POST['options'];

			$c_images = (!empty($_POST['c_images'])) ? $_POST['c_images'] : array();
									// Se inseriu imagens adiciona imagens senão array vazio
			$images = (!empty($_FILES['images'])) ? $_FILES['images'] : array();
			
			// Verifica se foram enviados os dados obrigatórios
			if(!empty($id) && !empty($id_category) && !empty($id_brand) && !empty($name) && !empty($stock) && !empty($price)) {
				// Instancia o model de Produtos
				$products = new Products();
				// Envia os dados para serem salvos
				$products->edit(
					$id_category,
					$id_brand,
					$name,
					$description,
					$stock,
					$price_from,
					$price,

					$weight,
					$width,
					$height,
					$length,
					$diameter,

					$featured,
					$sale,
					$bestseller,
					$new_product,

					$options,
					$images,
					$c_images,

					$id
				);
	
			} else {
				$_SESSION['formError'] = array('id_category', 'id_brand', 'name', 'stock', 'price');
				header("Location: ".BASE_URL."products/edit/".$id);
				exit;
			}
			header("Location: ".BASE_URL."products");
			exit;

		} else {
			$_SESSION['formError'] = array();
			header("Location: ".BASE_URL."products");
			exit;
		}
				
	}

	// Adiciona Produto
  public function add() {
		$cat = new Categories();
		$brands = new Brands();
		$options = new Options();

		$this->arrayInfo['cat_list'] = $cat->getAll();
		$this->arrayInfo['brands_list'] = $brands->getAll();
		$this->arrayInfo['options_list'] = $options->getAll();

		$this->arrayInfo["errorItems"] = array();

		if(isset($_SESSION['formError']) && count($_SESSION['formError']) > 0) {
			$this->arrayInfo['errorItems'] = $_SESSION['formError'];
			unset($_SESSION['formError']);
		}

		$this->loadTemplate("products_add", $this->arrayInfo);
	}

	public function add_action() {
		//echo '<pre>';print_r($_FILES);exit;echo '</pre>';
		
		if(!empty($_POST['name'])) {
			//echo '<pre>';print_r($_POST);exit;echo '</pre>';

			// Pega os dados do produto
			$id_category = $_POST['id_category'];
			$id_brand = $_POST['id_brand'];
			$name = $_POST['name'];
			$description = $_POST['description'];
			$stock = $_POST['stock'];						
			$price_from = $_POST['price_from'];
			$price = $_POST['price'];			
			/*echo '<pre>';print_r($_POST);exit;echo '</pre>';*/			
			$weight = $_POST['weight'];
			$width = $_POST['width'];
			$height = $_POST['height'];
			$length = $_POST['length'];
			$diameter = $_POST['diameter'];

			$featured = (!empty($_POST['featured']))?1:0;
			$sale = (!empty($_POST['sale']))?1:0;
			$bestseller = (!empty($_POST['bestseller']))?1:0;
			$new_product = (!empty($_POST['new_product']))?1:0;
			//echo '<pre>';print_r($_POST);exit;echo '</pre>';
			$options = $_POST['options'];
									// Se inseriu imagens adiciona imagens senão array vazio
			$images = (!empty($_FILES['images'])) ? $_FILES['images'] : array();
			
			// Verifica se foram enviados os dados obrigatórios
			if(!empty($id_category) && !empty($id_brand) && !empty($name) && !empty($stock) && !empty($price)) {
				// Instancia o model de Produtos
				$products = new Products();
				// Envia os dados para serem salvos
				$products->add(
					$id_category,
					$id_brand,
					$name,
					$description,
					$stock,
					$price_from,
					$price,

					$weight,
					$width,
					$height,
					$length,
					$diameter,

					$featured,
					$sale,
					$bestseller,
					$new_product,

					$options,
					$images
				);
	
			} else {
				$_SESSION['formError'] = array('id_category', 'id_brand', 'name', 'stock', 'price');
				header("Location: ".BASE_URL."products/add");
				exit;
			}
			header("Location: ".BASE_URL."products");
			exit;

		} else {
			$_SESSION['formError'] = array('name');
			header("Location: ".BASE_URL."products/add");
			exit;
		}
	}

	public function del($id) {

		if(!empty($id)) {

			$products = new Products();
			$products->del($id);
		}

		header("Location: ".BASE_URL."products");
		exit;

	}

	public function del_rate($id_rate) {

		if(!empty($id_rate)) {

			$rates = new Rates();
			$id_product = $rates->del($id_rate);
			
			if($id_product > 0) {
				header("Location: ".BASE_URL."products/edit/".$id_product);
				exit;
			}
		}
		header("Location: ".BASE_URL."products");
		exit;
	}

	public function add_rate() {
		$this->arrayInfo["errorItems"] = array();

			if(isset($_SESSION['formError']) && count($_SESSION['formError']) > 0) {
				$this->arrayInfo['errorItems'] = $_SESSION['formError'];
				unset($_SESSION['formError']);
			}
			
		$this->loadTemplate("rates_add", $this->arrayInfo);
	}

	public function add_action_rates() {
		if(!empty($_POST['id_user'])) {
			$rates = new Rates();

			

			header("Location: ".BASE_URL."rates");
			exit;

		} else {
			$_SESSION['formError'] = array();

			header("Location: ".BASE_URL."rates/add");
			exit;
		}
	}
  	
}