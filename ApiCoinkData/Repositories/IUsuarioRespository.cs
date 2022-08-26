using ApiCoinkModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiCoinkData.Repositories
{
    public interface IUsuarioRespository
    {
        Task<IEnumerable<VmUsuario>> GetUsuarios(); //Espacios
        Task<Usuario> GetDetalleUsuarios();
        Task<string> InsertUsuario(Usuario user);
        Task<string> InsertStoredProcedureUsuario(Usuario user);

    }
}
