using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Security.Claims;
using System.Security.Principal;

namespace REPORT_MANAGEMENT_APP
{
    public static class FunctionHelper
    {

        public static string ValueOrDefault(this string value)
        {
            return string.IsNullOrWhiteSpace(value) ? "N/A" : value;
        }

        public static Object EmptyStringPipe(this Object obj)
        {
            if (typeof(Object) is IEnumerable<Object>)
            {
                return obj;
            }
            else
            {
                var listProperties = obj.GetType().GetProperties();
                foreach (var property in listProperties)
                {
                    if (property.CanRead/* && property.PropertyType.Name == "String"*/)
                    {
                        if (property.GetValue(obj, null) == null)
                        {
                            if (property.PropertyType.IsValueType)
                            {
                                if (Nullable.GetUnderlyingType(property.PropertyType) != null)
                                {
                                    property.SetValue(obj, Activator.CreateInstance(Nullable.GetUnderlyingType(property.PropertyType)), null);
                                }
                                property.SetValue(obj, Activator.CreateInstance(property.PropertyType), null);
                            }
                            
                        }
                    }
                }
                return obj;
            }
        }

        public static T GetUserId<T>(this IIdentity identity) where T : IComparable<T>
        {
            if (identity == null)
            {
                throw new ArgumentNullException("identity");
            }

            ClaimsIdentity claimsIdentity = identity as ClaimsIdentity;
            if (claimsIdentity != null)
            {
                string text = claimsIdentity.FindFirstValue("http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier");
                if (text != null)
                {
                    if (typeof(T) == typeof(Guid))
                    {
                        var converter = TypeDescriptor.GetConverter(typeof(T));
                        return (T)converter.ConvertFromString(text);
                    }
                    else
                    {
                        return (T)Convert.ChangeType(text, typeof(T), CultureInfo.InvariantCulture);
                    }
                }
            }

            return default(T);
        }

    }
}

