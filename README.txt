Cofee Cafe Rest API V1

API Url Structures


| URL              | Method  | Parameters                                     | Description                                      |
| -----------------|:-------:| ----------------------------------------------:|-------------------------------------------------:|
| /v1/register     | POST    | name, email,tel,password,longit,latit          | User registration           					 | 
| /v1/login        | POST    | email, password                                | User login                  					 |
| /v1/locations    | POST    | lat, lan , rdsKm(optional)                     | Location listing based on user geo location      |
| /v1/categories   | POST    |                                                | Category Listing                                 |
| /v1/items        | POST    | location  category                             | Location , Item Category                         |
| /v1/plans        | POST    | location  category                             | Location Plans Based on Categories - Default all | 

| /v1/subscriptions| POST    | member                                         | Get All Member subscriptions                     | 
| /v1/consume      | POST    | subscription_id,member,quantity,item_code,mode
                              ,quantity,comment,pickup_time,pickup_date	      | Get all user subscriptions                       | 

 /v1/add_review    | POST    | member,location,comment,star            	      | Post Location Review                             | 
 /v1/reviews       | POST    | location                                       | All Reviews                                      |
 /v1/forgotpwd     | POST    | email                                          | Send Reset Password                              |  









| Function         | Req/Res | Parameters                                     | Description                                      |
| -----------------|:-------:| ----------------------------------------------:|-------------------------------------------------:|
| Register		   | Req     | name, email,tel,password,picture               | User registration           					 | 
|                  | Res     | error(true/false),message                      |                   					 			 |

| Login            | Req     | email,password                                 | User login     									 |
|   			   | Res     | error(true/false),message                      |                     				             |

| Forgot Password  | Req     | email                                          | User Forgot Password                             |
|  		           | Res     | error(true/false),message                      |  												 | 

| Location Caregory| Req     | no param                                       | Location Caregory                                |
|  		           | Res     | catid,name,description,picture                 |  												 | 

| *******************************************************************************************************************************|
  									Shop filter should implement latter 
  									(Near by,Distance,Open Now,Locations,Delivery)
| Shops List       | Req     | catid,Lat,Long(optional),limit                 | Shops List by Locations                          |
|  		           | Res     | shopId,name,address,tel,lat,long,distance,upto,|  												 |
|  		           | Res     | picture,openhours,							  |  												 | 

| *******************************************************************************************************************************|

| Shop Items       | Req     | shopId                                         | Shop Items with Catergory                        |
|  		           | Res     | {[catid,name,price,description,upto,picture],  |  												 | 
|  		           |         | {[item,name,price,description,upto,picture]}}  |  												 | 
