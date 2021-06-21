using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;

namespace Recetario.Nucleo.Entidades {
    public class Paso {
        #region Entidad
        public int Id{get;set;}

        [Required]
        [DataType(DataType.Text)]
        public int Numero { get; set; }
        [Required]
        [DataType(DataType.Text)]
        public string Descripcion { get; set; }
        #endregion Entidad

        #region Persistencia
        #endregion Persistencia
    }
}
