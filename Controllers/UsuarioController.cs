using ApiCoinkData.Repositories;
using ApiCoinkModel;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace PruebaCoink
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IUsuarioRespository _usuarioRepository;

        public UsuarioController(IUsuarioRespository usuarioRepository)
        {
            _usuarioRepository = usuarioRepository;
        }
        [HttpGet]
        public async Task<IActionResult> getAllUser()
        {
            try
            {

                return Ok(await _usuarioRepository.GetUsuarios());
            }
            catch (Exception ex)
            {

                return Ok(ex.Message);
            }
        }

        [HttpPost]
        [Route("CreateNewUser")]
        public async Task<IActionResult> CreateUsuario([FromBody] Usuario user)
        {
            if (user == null) return BadRequest();
            if (!ModelState.IsValid) return BadRequest(ModelState);

            var created = await _usuarioRepository.InsertUsuario(user);

            return Created("created", created);
        }
        [HttpPost]
        [Route("CreateNewUserSp")]
        public async Task<IActionResult> CreateUsuarioProcedure([FromBody] Usuario user)
        {
            try
            {
                if (user == null) return BadRequest();
                if (!ModelState.IsValid) return BadRequest(ModelState);

                var created = await _usuarioRepository.InsertStoredProcedureUsuario(user);

                return Created("created", created);

            }
            catch (Exception ex)
            {
                return Ok(ex.Message);
            }
     
        }


    }
}
