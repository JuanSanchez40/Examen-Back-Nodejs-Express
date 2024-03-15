module.exports = app => {
    const entradas = require("../controllers/entradas.controller.js");

    var router = require("express").Router();
  
    // Create a new Alumno
    router.post("/", entradas.create);
    
    // Retrieve all Tutorials
    router.get("/", entradas.findAll);

    // Upload Images files
  
    // Retrieve all published Tutorials
   // router.get("/published", tutorials.findAllPublished);
  
    // Retrieve a single Tutorial with id
 //   router.get("/:id", tutorials.findOne);
  
    // Update a Tutorial with id
 //   router.put("/:id", tutorials.update);
  
    // Delete a Tutorial with id
 //    router.delete("/:id", tutorials.delete);
  
    // Delete all Tutorials
 //   router.delete("/", tutorials.deleteAll);
  
   app.use('/api/entradas', router);
};
  