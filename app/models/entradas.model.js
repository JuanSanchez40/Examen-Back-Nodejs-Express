module.exports = (sequelize, Sequelize) => {
    const Entradas = sequelize.define("entradas", {
      titulo: {
        type: Sequelize.STRING
      },
      autor: {
        type: Sequelize.STRING
      },
      fecha: {
        type: Sequelize.STRING
      },
      contenido: {
        type: Sequelize.STRING
      }
    });
  
    return Entradas;
  };