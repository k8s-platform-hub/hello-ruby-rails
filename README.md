# hello-ruby-rails

This quickstart consists of a basic Hasura project using Rails. Once this project is deployed on to a Hasura cluster, you will have the Rails app running at https://app.cluster-name.hasura-app.io

This is the right place to start if you are planning to build or want to learn to build a Rails app with Hasura.

### Step 1: Getting the project

```sh
$ hasura quickstart hasura/hello-ruby-rails
$ cd hello-ruby-rails
```

The above command does the following:
1. Creates a new folder in the current working directory called `hello-ruby-rails`
2. Creates a new trial hasura cluster for you and sets that cluster as the default cluster for this project
3. Initializes `hello-ruby-rails` as a git repository and adds the necessary git remotes.

### Step 2: Getting cluster information

Every Hasura project is run on a Hasura cluster. To get details about the cluster this project is running on:

```sh
$ hasura cluster status
```

This will give you your cluster status like so

```sh
INFO Status:                                      
Cluster Name:       h34-excise98-stg
Cluster Alias:      hasura
Kube Context:       h34-excise98-stg
Platform Version:   v0.15.3
Cluster State:      Synced
```

Keep a note of your cluster name. Alternatively, you can also go to your [hasura dashboard](https://dashboard.hasura.io) and see the clusters you have.

### Step 3: Make modifications to Rails microservice

```sh
$ cd microservices/app
```

1. The base files are in the src directory. Write your Rails app in this directory
3. Modify k8s.yaml to specify any additional environment variables

### Step 4: Deploying on a Hasura cluster

```sh
$ git add .
$ git commit -m "Initial Commit"
$ git push hasura master

```

## Important: Migrations

Hasura comes with support for schema migrations. If you are using Rails, you may wish to use ActiveRecord for your schema migrations. This leads to conflicting mechanisms for schema migrations. Therefore, care must be taken. Following are the guidelines for using Hasura with your Rails project, if you choose to use ActiveRecord:

1. Do not create migrations from api-console. This includes creating tables, adding permissions etc.
2. Do not remove the line `ActiveRecord::Base.schema_migrations_table_name = "rails_schema_migrations"` from your <environment>.rb config file. In this project, it is present only in production.rb.

If you choose to use Hasura Data service completely, then you may wish to remove ActiveRecord gem from the Gemfile.
