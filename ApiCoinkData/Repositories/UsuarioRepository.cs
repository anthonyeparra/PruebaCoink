using ApiCoinkModel;
using Dapper;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiCoinkData.Repositories
{
   public class UsuarioRepository : IUsuarioRespository
    {
        private MySQLConfiguration _connectionString;
        public UsuarioRepository(MySQLConfiguration connectionString)
        {
            _connectionString = connectionString;
        }

        protected MySqlConnection dbConnection() 
        {
            return new MySqlConnection(_connectionString.ConnectionString);
        }
        public Task<Usuario> GetDetalleUsuarios()
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<VmUsuario>> GetUsuarios()
        {
            var db = dbConnection();
            var sql = @"SELECT u.id,u.nombre,u.`telefono`,u.`direccion`,m.`nombre` AS municipio,d.`nombre` AS departamento,p.`nombre` AS pais 
                    FROM usuario u 
                    INNER JOIN municipio m ON m.`id` = u.Municipio_id
                    INNER JOIN `departamento` d ON d.`id` = m.`Departamento_id`
                    INNER JOIN pais p ON p.`id` = d.`Pais_id`";
            return await db.QueryAsync<VmUsuario>(sql, new { });
        }

        public async Task<string> InsertUsuario(Usuario user)
        {
            var message = "No se pudo Insertar el usuario";
            var db = dbConnection();
            var sql = @"INSERT INTO usuario (nombre,telefono,direccion,municipio_id) VALUES (@nombre,@telefono,@direccion,@Municipio_Id)";
            var result = await db.ExecuteAsync(sql, new {user.Nombre,user.Telefono,user.Direccion,user.Municipio_Id });
            if (result > 0 )
            {
                message = "Se ha insertado correctamente "; 
            }
            return message;
        }

        public async Task<string> InsertStoredProcedureUsuario(Usuario user)
        {
            var message = "No se pudo Insertar el usuario";

            var db = dbConnection();

            var sql = @" INSERTAR_USUARIO ";

            var result = await db.ExecuteAsync(sql,
                new { user.Nombre, user.Telefono, user.Direccion, user.Municipio_Id }
                ,commandType :System.Data.CommandType.StoredProcedure);

            if (result > 0) message = "Se ha insertado correctamente ";
 
        
            return message;
        }
    }
}
