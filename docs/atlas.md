### MongoDB Atlas Cluster

MFlix uses MongoDB to persist all of its data.

One of easiest ways to get up and running with MongoDB is to use MongoDB Atlas,
a hosted and fully-managed database solution.

If you have taken other MongoDB University courses like M001 or M121, you may
already have an account - feel free to reuse that cluster for this course.

*Note: Be advised that some of the UI aspects of Atlas may have changed since
the inception of this README, therefore some of the screenshots in this file may
be different from the actual Atlas UI interface.*


### Using an existing MongoDB Atlas Account:

If you already have a previous Atlas account created, perhaps because you've
taken one of our other MongoDB university courses, you can repurpose it for
M220P.

Log-in to your Atlas account and create a new project named **M220** by clicking
on the *Context* dropdown menu:

![create_project](https://s3.amazonaws.com/university-courses/m220/cluster_create_project.png)

After creating a new project, you need to create a **mflix** free tier cluster.


#### Creating a new MongoDB Atlas Account:

If you do not have an existing Atlas account, go ahead and [create an Atlas
Account](https://cloud.mongodb.com/links/registerForAtlas) by filling in the
required fields:

![registration](https://s3.amazonaws.com/university-courses/m220/atlas_registration.png)


#### Creating a free tier cluster called "mflix":

*Note: You will need to do this step even if you are reusing an Atlas account.*

1. After creating a new project, you will be prompted to create the first
   cluster in that project:

![cluster_create](https://s3.amazonaws.com/university-courses/m220/cluster_create.png)


2. Choose AWS as the cloud provider, in a Region that has the label
   ``FREE TIER AVAILABLE``:

![cluster_provider](https://s3.amazonaws.com/university-courses/m220/cluster_provider.png)


3. Select *Cluster Tier* M0:

![cluster_tier](https://s3.amazonaws.com/university-courses/m220/cluster_tier.png)


4. Set *Cluster Name* to **mflix** and click "Create Cluster":

![cluster_name](https://s3.amazonaws.com/university-courses/m220/cluster_name.png)


5. Once you press *Create Cluster*, you will be redirected to the account
   dashboard. In this dashboard, make sure you set your project name to **M220**.
   Go to `Settings` menu item and change the project name from the default
   **Project 0** to **M220**:

![cluster_project](https://s3.amazonaws.com/university-courses/m220/cluster_project.png)


6. Configure the network settings of this cluster in the **Network Access** tab,
   so you can connect from your IP address. When you select `ADD IP ADDRESS`,
   the menu that appears may give you the option to add `ADD CURRENT IP ADDRESS`. This is preferable, but if this option does not appear, please
   select `ALLOW ACCESS FROM ANYWHERE`:

![whitelist_an_ip_address](https://s3.amazonaws.com/university-courses/m220/whitelist_an_ip_address.png)

![add_whitelist_entry](https://s3.amazonaws.com/university-courses/m220/add_whitelist_entry.png)

7. Then create the application MongoDB database user required for this course:

  - username: **m220student**
  - password: **m220password**

You can create new users through *Security* -> *Add New User*.

Allow this user the privilege to `Read and write to any database`:

![cluster_application_user](https://s3.amazonaws.com/university-courses/m220/cluster_application_user.png)


8. When the user is created, and the cluster deployed, you have the option to
   `Load Sample Dataset`. This will load the Atlas sample dataset, containing
   the MFlix database, into your cluster:

![load_sample_dataset](https://s3.amazonaws.com/university-courses/m220/load_sample_dataset.png)

**Note: The MFlix database in the Sample Dataset is called "sample_mflix".**


9. Now you can test the setup by
   connecting via `mongo` shell. You can find instructions to connect in the
   "Connect" section of the cluster dashboard:

![cluster_connect_application](https://s3.amazonaws.com/university-courses/m220/cluster_connect_application.png)

Go to your cluster *Overview* -> *Connect* -> *Connect Your Application*. Select
the option corresponding to your local MongoDB version and copy the `mongo` connection string.

The below example connects to Atlas as the user you created before, with
username `m220student` and password `m220password`. You can run this command from your command line:

```sh

  mongo "mongodb+srv://m220student:m220password@<YOUR_CLUSTER_URI>"

```

By connecting to the server from your host machine, you have validated that the
cluster is configured and reachable from your local workstation.

The connection string you used to connect will be used in your MFlix application
as well.


#### Importing Data (Optional)

**Note: if you used Load Sample Dataset, you can skip this step.**

The `mongorestore` command necessary to import the data is located below. Copy
and paste the command, and replace `<your-atlas-uri>` with your Atlas SRV string:

```sh

  # navigate to mflix-python directory
  cd mflix-python

  # import data into Atlas
  mongorestore --drop --gzip --uri <your-atlas-uri> data

```
