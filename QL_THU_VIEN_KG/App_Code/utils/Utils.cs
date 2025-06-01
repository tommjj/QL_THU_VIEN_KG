using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Utils
/// </summary>
public static class Utils
{
    /// <summary>
    /// HashBJB2 calculates a hash value for the given input string using the BJB2 algorithm.
    /// 0-999 hash values are returned.
    /// 
    /// surse: http://www.cse.yorku.ca/~oz/hash.html
    /// </summary>
    public static int HashBJB2(string input)
    {
        int hash = 5381;
        foreach (char c in input)
        {
            hash = ((hash << 5) + hash) ^ c; // hash * 33 + c
        }
        return hash % 1000;
    }
}