<?php
/**
 * Cofee REST App Index
 *
 * @author Gayan Chathuranga <chathurangagc@gmail.com>
 * @link   http://orexinc.com
 */


require_once '../include/DbHandler.php';
require_once '../include/PassHash.php';
require '.././libs/Slim/Slim.php';
include '../include/Cofee.fnc.php';


\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();

// User id from db - Global Variable
$user_id = NULL;


/**
 * ----------- METHODS WITHOUT AUTHENTICATION ---------------------------------
 */
/**
 * User Registration
 * url - /register
 * method - POST
 * params - name, email, telephone, password, longit, latit
 */
$app->post('/register', function() use ($app) {
            // check for required params
            verifyRequiredParams(array('name', 'email','tel','password'));

            $response = array();

            // reading post params
            $name = $app->request->post('name');
            $email = $app->request->post('email');
            $picture = $app->request->post('picture');
            $tel = $app->request->post('tel');
            $password = $app->request->post('password');
            $longit   = $app->request->post('longit');
            $latit    = $app->request->post('latit');


            // validating email address
            validateEmail($email);
 
            $db = new DbHandler(); 
            $res = $db->createUser($name, $email, $password, $tel, $picture, $longit, $latit);

            if ($res == USER_CREATED_SUCCESSFULLY) {
                $response["error"] = false;
                $response["message"] = "You are successfully registered";
            } else if ($res == USER_CREATE_FAILED) {
                $response["error"] = true;
                $response["message"] = "Oops! An error occurred while registereing";
            } else if ($res == USER_ALREADY_EXISTED) {
                $response["error"] = true;
                $response["message"] = "Sorry, this email already existed";
            }
            // echo json response
            echoRespnse(201, $response);
        });

/**
 * User Login
 * url - /login
 * method - POST
 * params - email, password
 */
$app->post('/login', function() use ($app) {
            // check for required params
            verifyRequiredParams(array('email', 'password'));


            // reading post params
            $email = $app->request()->post('email');
            $password = $app->request()->post('password');
            $response = array();

            $db = new DbHandler();
            // check for correct email and password
            if ($db->checkLogin($email, $password)) {
                // get the user by email
                $user = $db->getUserByEmail($email);

                if ($user != NULL) {
                    $response["error"] = false;
                    $response['id'] = $user['id'];
                    $response['name'] = $user['name'];
                    $response['email'] = $user['email'];
                    $response['contact_no'] = $user['contact_no'];
                    $response['picture'] = $user['picture'];
                    $response['apiKey'] = $user['api_key'];
                    $response['createdAt'] = $user['created_at'];
                } else {
                    // unknown error occurred
                    $response['error'] = true;
                    $response['message'] = "An error occurred. Please try again";
                }
            } else {
                // user credentials are wrong
                $response['error'] = true;
                $response['message'] = 'Login failed. Incorrect credentials';
            }

            echoRespnse(200, $response);
        });


/**
 * User Forgot Password
 * url - /forgotpwd
 * method - POST
 * params - email
 */
$app->post('/forgotpwd', function() use ($app) {
            // check for required params
            verifyRequiredParams(array('email'));


            // reading post params
            $email = $app->request()->post('email');

            $response = array();

            $db = new DbHandler();
            // check for correct email and password
            if ($db->isMailExists($email)) {
                // get the user by email
                $forgotten_password_code = rand();               
                if ($db->setPasswordCode($email,$forgotten_password_code)) {
                    $db->sendeMail($email,$forgotten_password_code);
                    $response["error"] = false;
                    $response['message'] = 'Password reset code sent to your mail';
                } else {
                    // unknown error occurred
                    $response['error'] = true;
                    $response['message'] = "An error occurred. Please try again";
                }
            } else {
                // user credentials are wrong 
                $response['error'] = true;
                $response['message'] = 'User not exists';
            }

            echoRespnse(200, $response);
 });



/**
 * Location Listing
 * url - /locations
 * method - POST
 * params - sourceLat, sourceLon
 */
$app->post('/locations', function() use ($app) {
            // check for required params
            verifyRequiredParams(array('category'));

            // reading post params
            $category = $app->request()->post('category');
            $lat = ($app->request()->post('lat')) ? $app->request()->post('lat') : null;
            $lon = ($app->request()->post('lon')) ?  $app->request()->post('lon') : null;
            $rdsKm = ($app->request()->post('rdsKm')) ? $app->request()->post('rdsKm') : 5;

            $response = array();

            $db = new DbHandler();
            // get the user by email
            $locations = $db->getCategoryLocations($lat,$lon,$category);

            if (count($locations)>0) {
                $response['error'] = false;
                $response['data'] = $locations;              
            } else {
                // unknown error occurred
                $response['error'] = true;
                $response['message'] = "No Locations Founds around you.";
            }

            echoRespnse(200, $response);
});


/**
 * Location Details
 * url - /location
 * method - POST
 * params - location, lon,  lat
 */
$app->post('/location', function() use ($app) {
            // check for required params
            verifyRequiredParams(array('location'));


            // reading post params
            $lat = ($app->request()->post('lat')) ? $app->request()->post('lat') :  NULL;
            $lon = ($app->request()->post('lon')) ? $app->request()->post('lon') :  NULL;
            $location = $app->request()->post('location');

            $response = array();

                $db = new DbHandler();
                // get the user by email
                $location = $db->getLocation($location,$lat,$lon);

                if (count($location)>0) {
                    $response['error'] = false;
                    $response['data'] = $location;
                  
                } else {
                    // unknown error occurred
                    $response['error'] = true;
                    $response['message'] = "No Locations Found";
                }

            echoRespnse(200, $response);
});


/**
 * category Listing
 * url - /locations
 * method - POST
 * params - parent - Parent Categories (0) or Sub Cateories (parent_Category ID)
 */
$app->post('/categories', function() use ($app) {

            // reading post params
            $parent = ($app->request()->post('parent')) ? $app->request()->post('parent') : 0;

            $response = array();

                $db = new DbHandler();
                // get the user by email
                $categories = $db->getCategoryList($parent);

                if (count($categories)>0) {
                    $response['error'] = false;
                    $response['data'] = $categories;
                  
                } else {
                    // unknown error occurred
                    $response['error'] = true;
                    $response['message'] = "No Categories Found";
                }

            echoRespnse(200, $response);
});


/**
 * Fetch Location Items
 * url - /items
 * method - POST
 * params - location
 */
$app->post('/items', function() use ($app) {

            verifyRequiredParams(array('location'));

            // reading post params
            $location = ($app->request()->post('location')) ? $app->request()->post('location') : 0;
            $category = ($app->request()->post('category')) ? $app->request()->post('category') : 0;

            $response = array();

                $db = new DbHandler();
                // get the user by email
                $items = $db->getLocationItems($location,$category);

                if (count($items)>0) {
                    $response['error'] = false;
                    $response['data'] = $items;
                  
                } else {
                    // unknown error occurred
                    $response['error'] = true;
                    $response['message'] = "No Categories Found";
                }

            echoRespnse(200, $response);
});

/**
 * Fetch Single Location Item
 * url - /items
 * method - POST
 * params - location
 */
$app->post('/items', function() use ($app) {

            // reading post params
            $location = ($app->request()->post('location')) ? $app->request()->post('location') : 0;

            $response = array();

                $db = new DbHandler();
                // get the user by email
                $items = $db->getLocationItems($location);

                if (count($items)>0) {
                    $response['error'] = false;
                    $response['data'] = $items;
                  
                } else {
                    // unknown error occurred
                    $response['error'] = true;
                    $response['message'] = "No Categories Found";
                }

            echoRespnse(200, $response);
});


/**
 * Fetch Location Plans
 * url - /plans
 * method - POST
 * params - location
 */
$app->post('/plans', function() use ($app) {

            verifyRequiredParams(array('location'));

            
            // reading post params
            $location = ($app->request()->post('location')) ? $app->request()->post('location') : 0;
            $category = ($app->request()->post('category')) ? $app->request()->post('category') : 0;
            
            $response = array();

                $db = new DbHandler();
                // get the user by email
                $plans = $db->getLocationPlans($location,$category);

                if (count($plans)>0) {
                    $response['error'] = false;
                    $response['data'] = $plans;
                  
                } else {
                    // unknown error occurred
                    $response['error'] = true;
                    $response['message'] = "We have no subscription plans avaialble now";
                }

            echoRespnse(200, $response);
});

/**
 * Fetch Member Subscriptions
 * url - /subscriptions
 * method - POST
 * params - user_id
 */
$app->post('/subscriptions', function() use ($app) {

            verifyRequiredParams(array('member'));
   
            // reading post params
            $member = ($app->request()->post('member')) ? $app->request()->post('member') : 0;
            
            $response = array();

                $db = new DbHandler();
                // get the user by email
                $subscriptions = $db->getMemberLocationPlans($member);

                if (count($subscriptions)>0) {
                    $response['error'] = false;
                    $response['data'] = $subscriptions;
                  
                } else {
                    // unknown error occurred
                    $response['error'] = true;
                    $response['message'] = "We have no subscription plans avaialble now";
                }

            echoRespnse(200, $response);
});

/**
 * Deduct From Subscription Usage
 * url - /subscriptions
 * method - POST
 * params - user_id
 */
$app->post('/consume', function() use ($app) {

        $user_data = json_decode($app->request()->getBody());
        $item_data = $user_data->items;

        $member = $user_data->data->member;
        $mode = $user_data->data->mode;
        $comment = $user_data->data->comment;
        $pickup_time = $user_data->data->pickup_time;
        $pickup_date = $user_data->data->pickup_date;

        foreach ($item_data as $item) {
            
            // reading post params
            $subscription = $item->subscription;
            $quantity = $item->quantity;
            $item_code = $item->item_code;
            
            $response = array();

                $db = new DbHandler();
                    //echo json_encode($db->doConsume($subscription,$member,$quantity,$item_code, $mode ,$quantity,$comment,$pickup_time,$pickup_date)); exit();
                if ($db->doConsume($subscription,$member,$quantity,$item_code, $mode ,$quantity,$comment,$pickup_time,$pickup_date)) {

                    $response['error'] = false;
                    $response['data'] = 'Successfully Added';//$db->getSubscription($subscription);
                  
                } else {
                    // unknown error occurred
                    $response['error'] = true;
                    $response['message'] = "Error processing your subscription";
                }
        }
            echoRespnse(200, $response);
});


/**
 * Add Review
 * url - /add_review
 * method - POST
 * params - member,location,comment,star
 */
$app->post('/add_review', function() use ($app) {

            verifyRequiredParams(array('member','location','comment','star'));
            
            // reading post params
            $member = ($app->request()->post('member')) ? $app->request()->post('member') : 0;
            $location = ($app->request()->post('location')) ? $app->request()->post('location') : 0;
            $comment = ($app->request()->post('comment')) ? $app->request()->post('comment') : 0;
            $star = ($app->request()->post('star')) ? $app->request()->post('star') : 0;
            
            $response = array();

                $db = new DbHandler();
                // get the user by email
                if ($db->addReview($member, $location, $comment, $star)) {
                    $response['error'] = false;
                    $response['data'] = 'Review Added successfully';
                  
                } else {
                    // unknown error occurred
                    $response['error'] = true;
                    $response['message'] = "We have no subscription plans avaialble now";
                }

            echoRespnse(200, $response);
});



/**
 * View all Reviews
 * url - /reviews
 * method - POST
 * params - location
 */
$app->post('/reviews', function() use ($app) {

            verifyRequiredParams(array('location'));
            
            // reading post params
            $location = ($app->request()->post('location')) ? $app->request()->post('location') : 0;

            
            $response = array();

                $db = new DbHandler();
                $reviews = $db->getReviews($location);
                // get the user by email
                if (count($reviews)>0) {
                    $response['error'] = false;
                    $response['data'] = $reviews;
                  
                } else {
                    // unknown error occurred
                    $response['error'] = true;
                    $response['message'] = "We have no subscription plans avaialble now";
                }

            echoRespnse(200, $response);
});

/**
 * Favourite a location
 * url - /favourite
 * method - POST
 * params - location
 */
$app->post('/favourite', function() use ($app) {

            verifyRequiredParams(array('location'));
            
            // reading post params
            $location = ($app->request()->post('location')) ? $app->request()->post('location') : 0;

            
            $response = array();

                $db = new DbHandler();
                $result = $db->favouriteLocation($location);

                if ($result) {
                    $response['error'] = false;
                    $response['data'] = 'Location add to your favourite list';
                  
                } else {
                    // unknown error occurred
                    $response['error'] = true;
                    $response['message'] = "There was error adding to favourite list";
                }

            echoRespnse(200, $response);
});




/**
 * Order
 * url - /subscriptions
 * method - POST
 * params - user_id
 */
$app->post('/order', function() use ($app) {

        $order_data = json_decode($app->request()->getBody());
        //$item_data = $order_data->subscriptions;
        $item_data = $order_data->items;

        $vat = $order_data->data->vat;
        $total = $order_data->data->total;
        $user_id = $order_data->data->user_id;
        $shop_id = $order_data->data->shop_id;
        $order_id = $order_data->data->order_id;
        $discount = $order_data->data->discount;

          $db = new DbHandler();

         if ($db->addOrder($order_id,$user_id,$shop_id,$total,$discount,$vat)){

                    foreach ($item_data as $item) {
            
                        // reading post params
                        //$subscription = $item->subscription;
                        $unit_cost = $item->unit_cost;
                        $quantity = $item->quantity;
                        $item_code = $item->item_code;
                        
                        $response = array();

                            // $db = new DbHandler();
                
                            if ($db->addOrderItems($order_id ,$shop_id , $item_code,$quantity,$unit_cost)) {

                                $response['error'] = false;
                                $response['data'] = 'Order Placed Succssfully';
                              
                            } else {
                                // unknown error occurred
                                $response['error'] = true;
                                $response['message'] = "Error processing your order";
                            }
                    }
                     
         } else {
                                // unknown error occurred
                                $response['error'] = true;
                                $response['message'] = "Order duplicate";
        }

        echoRespnse(200, $response);   
});


$app->run();
?>