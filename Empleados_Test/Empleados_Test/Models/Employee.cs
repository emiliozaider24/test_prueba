using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Empleados_Test.Models
{
    public class Employee
    {
        
        public int ID { get; set; }
        [Required(ErrorMessage = "Ingresa Nombre de Empleado")]
        [Display(Name = "Nombre de Empleado")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Ingresa Apellido Paterno")]
        [Display(Name = "Apellido Paterno")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Ingresa Apellido Materno")]
        [Display(Name = "Apellido Materno")]
        public string M_LastName { get; set; }

        [Required(ErrorMessage = "Ingresa RFC a 12 o 13 caracteres")]
        [Display(Name = "RFC")]
        public string RFC { get; set; }

        [Required(ErrorMessage = "Ingresa la fecha de nacimiento")]
        [Display(Name = "Fecha de Nacimiento")]
        public DateTime BornDate { get; set; }
        public EmployeeS Status { get; set; }
       
    }

    
}