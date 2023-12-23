
## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before you begin, ensure you have the following installed:
- Ruby
- Rails
- A database system (e.g., PostgreSQL, MySQL)

### Installation

To start using the application, follow these steps:

1. **Create the Database**
   
    ```bash
    rails db:create

2. **Run migrations**
   
    ```bash
    rails db:migrate

3. **Seed the Database**
   
    ```bash
    rails db:seed

4. **Start server**
   
    ```bash
    rails server


## Observations

- **Testing**: Specs have been created for the most critical parts of the application to ensure reliability and stability.
- **API Endpoint**: An API endpoint is provided for Step Additionally, a view is available to observe this functionality.
- **User-Friendly Take-Home**: The functionality is straightforward and, if needed, the essential parts of the application could be set up in approximately 30 minutes.
- **Registration Page**: A registration page has been added for user convenience.
- **Enhanced UI for Campgrounds**: Additional layouts have been implemented to improve the user experience on the campgrounds pages.



# API::V1::UsersController

The `UsersController` under the `Api::V1` namespace is responsible for handling API requests related to User data.

## Actions

### recently_viewed

- **Purpose**: Returns a list of the user's recently viewed campgrounds.
- **Method**: GET
- **URL**: `/api/v1/users/:user_id/recently_viewed`
- **Parameters**:
  - `user_id`: Integer, required. The ID of the user whose recently viewed campgrounds are being requested.
- **Responses**:
  - **Success (200 OK)**: Returns a JSON object containing an array of campgrounds with their `id`, `name`, `overview`, `city`, and `cover_photo_url`.
  - **User Not Found (404 Not Found)**: Occurs when no user with the specified ID exists.
  - **Internal Server Error (500 Internal Server Error)**: Generic error message, given when an unexpected condition was encountered.

## Private Methods

### fetch_user

- **Purpose**: Sets the `@user` instance variable to the user specified by the `user_id` parameter.
- **Usage**: Used as a `before_action` for the `recently_viewed` method.
- **Error Handling**: Renders a JSON response with an error message and a 404 status code if the user is not found.

## Example Request

```bash
curl -X GET "http://localhost:3000/api/v1/users/1/recently_viewed"

{
  "compgrounds": [
    {
      "id": 2,
      "name": "Roaring River Campground",
      "overview": "There’s a lot to rave about at Roaring River Campground, foremost being the unimaginably breathtaking views of deep green growth on gentle hills that tower over blue spring waters. If you want a good-hearted family-bonding sort of experience, undisturbed by the busy world outside of this pristine encapsulation of natural beauty, then pack your kids and fishing poles into the truck and get yourselves over here. We’re sure you’ll love and appreciate your time at this clean (and uncommercialized) part of Roaring River State Park. Did we mention that the campsites are a two minute walk from the river? And that the waters are stocked each night by one of our nation’s premier trout fisheries? Yes, awesome.",
      "city": "Eagle Rock",
      "cover_photo_url": "https://img.hipcamp.com/image/upload/c_fill,f_auto,g_auto,h_900,q_60,w_2040/v1471918359/campground-photos/k4xpocqd6guouuihdnj8.jpg"
    },
    {
      "id": 1,
      "name": "Lake Perris Campground",
      "overview": "Ready for a wildlife and adventure filled camping weekend? Lake Perris camping has 167 sites for tent camping and 264 paved RV sites (which have water, electricity, and sink water hookups). There is one hike and bike campsite located by the horseshoe pit, and there are 7 primitive horse camps. The sites are all equipped with a table, fire ring with a grill, and access to piped water. Most plants and animals at Lake Perris are well adapted to the hot, dry environment, so make sure you’re prepared as well. It can get quite warm in the summer and there isn’t too much tree coverage – so bring a canopy if you have one! Or just stay in the lake the whole time… that’s fine too.",
      "city": "Moreno Valley",
      "cover_photo_url": "https://img.hipcamp.com/image/upload/c_fill,f_auto,g_auto,h_900,q_60,w_2040/v1433546047/p5g8bgxrs7heihxo0sus.jpg"
    }
  ]
}

