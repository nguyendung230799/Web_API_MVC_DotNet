using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.Entity;
using System.Linq;
using System.Reflection;

namespace REPORT_MANAGEMENT_APP
{
    public static class EFSqlHelper
    {
        private class PropertyMapp
        {
            public string Name { get; set; }
            public Type Type { get; set; }
            public bool IsSame(PropertyMapp mapp)
            {
                if (mapp == null)
                {
                    return false;
                }
                bool same = mapp.Name == Name && mapp.Type == Type;
                return same;
            }
        }


        public static IEnumerable<T> FromSqlQuery<T>
        (this DbContext context, string query, List<DbParameter> parameters = null,
         CommandType commandType = CommandType.Text,
         int? commandTimeOutInSeconds = null) where T : new()
        {
            return FromSqlQuery<T>(context.Database, query, parameters,
                                   commandType, commandTimeOutInSeconds);
        }

        public static IEnumerable<T> FromSqlQuery<T>
               (this Database database, string query,
                List<DbParameter> parameters = null,
                CommandType commandType = CommandType.Text,
                int? commandTimeOutInSeconds = null) where T : new()
        {
            const BindingFlags flags = BindingFlags.Public |
            BindingFlags.Instance | BindingFlags.NonPublic;
            List<PropertyMapp> entityFields = (from PropertyInfo aProp
                                               in typeof(T).GetProperties(flags)
                                               select new PropertyMapp
                                               {
                                                   Name = aProp.Name,
                                                   Type = Nullable.GetUnderlyingType
                                          (aProp.PropertyType) ?? aProp.PropertyType
                                               }).ToList();
            List<PropertyMapp> dbDataReaderFields = new List<PropertyMapp>();
            List<PropertyMapp> commonFields = null;

            using (var command = database.Connection.CreateCommand())
            {
                if (command.Connection.State != ConnectionState.Open)
                {
                    command.Connection.Open();
                }
                var currentTransaction = database.CurrentTransaction;
                if (currentTransaction != null)
                {
                    command.Transaction = currentTransaction.UnderlyingTransaction;
                }
                command.CommandText = query;
                command.CommandType = commandType;
                if (commandTimeOutInSeconds != null)
                {
                    command.CommandTimeout = (int)commandTimeOutInSeconds;
                }
                if (parameters != null)
                {
                    command.Parameters.AddRange(parameters.ToArray());
                }
                using (var result = command.ExecuteReader())
                {
                    while (result.Read())
                    {
                        if (commonFields == null)
                        {
                            for (int i = 0; i < result.FieldCount; i++)
                            {
                                dbDataReaderFields.Add(new PropertyMapp
                                {
                                    Name = result.GetName(i),
                                    Type = result.GetFieldType(i)
                                });
                            }
                            commonFields = entityFields.Where
                            (x => dbDataReaderFields.Any(d =>
                             d.IsSame(x))).Select(x => x).ToList();
                        }

                        var entity = new T();
                        foreach (var aField in commonFields)
                        {
                            PropertyInfo propertyInfos =
                                    entity.GetType().GetProperty(aField.Name);
                            var value = (result[aField.Name] == DBNull.Value) ?
                                null : result[aField.Name]; //if field is nullable
                            propertyInfos.SetValue(entity, value, null);
                        }
                        yield return entity;
                    }
                }
            }
        }

        public static IEnumerable<T> FromSqlQuery<T>
        (this DbContext context, string query, Func<DbDataReader, T> map,
        List<DbParameter> parameters = null, CommandType commandType = CommandType.Text,
        int? commandTimeOutInSeconds = null)
        {
            return FromSqlQuery(context.Database, query, map, parameters,
                                commandType, commandTimeOutInSeconds);
        }

        public static IEnumerable<T> FromSqlQuery<T>
        (this Database database, string query, Func<DbDataReader, T> map,
        List<DbParameter> parameters = null,
        CommandType commandType = CommandType.Text,
        int? commandTimeOutInSeconds = null)
        {
            using (var command = database.Connection.CreateCommand())
            {
                if (command.Connection.State != ConnectionState.Open)
                {
                    command.Connection.Open();
                }
                var currentTransaction = database.CurrentTransaction;
                if (currentTransaction != null)
                {
                    command.Transaction = currentTransaction.UnderlyingTransaction;
                }
                command.CommandText = query;
                command.CommandType = commandType;
                if (commandTimeOutInSeconds != null)
                {
                    command.CommandTimeout = (int)commandTimeOutInSeconds;
                }
                if (parameters != null)
                {
                    command.Parameters.AddRange(parameters.ToArray());
                }
                using (var result = command.ExecuteReader())
                {
                    while (result.Read())
                    {
                        yield return map(result);
                    }
                }
            }
        }

        public static int ExecuteNonQuery(this DbContext context, string command,
        List<DbParameter> parameters = null,
        CommandType commandType = CommandType.Text,
        int? commandTimeOutInSeconds = null)
        {
            int value = ExecuteNonQuery(context.Database, command,
                        parameters, commandType, commandTimeOutInSeconds);
            return value;
        }

        public static int ExecuteNonQuery(this Database database,
                string command, List<DbParameter> parameters = null,
                CommandType commandType = CommandType.Text,
                int? commandTimeOutInSeconds = null)
        {
            using (var cmd = database.Connection.CreateCommand())
            {
                if (cmd.Connection.State != ConnectionState.Open)
                {
                    cmd.Connection.Open();
                }
                var currentTransaction = database.CurrentTransaction;
                if (currentTransaction != null)
                {
                    cmd.Transaction = currentTransaction.UnderlyingTransaction;
                }
                cmd.CommandText = command;
                cmd.CommandType = commandType;
                if (commandTimeOutInSeconds != null)
                {
                    cmd.CommandTimeout = (int)commandTimeOutInSeconds;
                }
                if (parameters != null)
                {
                    cmd.Parameters.AddRange(parameters.ToArray());
                }
                return cmd.ExecuteNonQuery();
            }
        }
    }
}

