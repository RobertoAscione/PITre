﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VtDocs.BusinessServices.Entities.Administration.Organigramma
{
    /// <summary>
    /// 
    /// </summary>
    [Serializable()]
    public class GetListUOByQualificheUtenteRequest : Request
    {
        /// <summary>
        /// Lista delle qualifiche utente per cui filtrare le UO
        /// </summary>
        public List<string> QualificheUtente
        {
            get;
            set;
        }
    }
}
