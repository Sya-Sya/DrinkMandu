using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace template.domain
{
    public class CommonAttributeRequest
    {
        [Required(ErrorMessage = "Function name is required")]
        public string FunctionName { get; set; }
        [Required(ErrorMessage = "Data is required")]
        public string Data { get; set; }
        [Required(ErrorMessage = "Signature is required")]
        public string Signature { get; set; }
    }
}