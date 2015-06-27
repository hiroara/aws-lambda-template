# aws-lambda-template

Template project for AWS Lambda.

## Getting started

    $ cd <PROJECT ROOT>
    $ wget https://github.com/hiroara/aws-lambda-template/raw/master/dist/aws-lambda-template-0.0.2.tgz -O - | tar xzv
    $ npm install

## Tasks

- `npm start`
  - gulp watch your scripts and build into `build` directory.
- `npm run build`
  - Build into `build` directory.
- `npm run bundle`
  - Build into `build` directory and archive as `build.zip`.
- `npm run create`
  - Create `build.zip` and create function on AWS Lambda
- `npm run update`
  - Re-create `build.zip` and update function on AWS Lambda
