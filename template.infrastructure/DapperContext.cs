using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;

namespace template.infrastructure
{
    public class DapperContext
    {
        private readonly IConfiguration _configuration;
        private readonly string? _connectionString;
        public readonly string? _IsApiCall;
        public readonly string? _ApiUrl;
        public readonly string? _ApiBearerUrl;

        public DapperContext(IConfiguration configuration)
        {
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("SqlConnection");
            _IsApiCall = _configuration["IsApiCall"];
            _ApiUrl = _configuration["APIurl"];
            _ApiBearerUrl = _configuration["APIBearerurl"];
        }

        public IDbConnection CreateConnection()
            => new SqlConnection(_connectionString);
    }
}