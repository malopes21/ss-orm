using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL_Projeto.SLL
{
    class CallDef
    {
        public string NomeDef { get; set; }
        private List<object> parValues = new List<object>();
        public List<object> ParValues
        {
            get { return parValues; }
            set { parValues = value; }
        }


		public override int GetHashCode() {
			int prime = 31;
			int result = 1;
			result = prime * result
					+ ((NomeDef == null) ? 0 : NomeDef.GetHashCode());
            foreach(object obj in parValues)
            {
                result = prime * result
                    + ((obj == null) ? 0 : obj.GetHashCode());
            }
            //result = prime * result
            //        + ((parValues == null) ? 0 : parValues.GetHashCode());
			return result;
		}


		public override bool Equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (GetType() != obj.GetType())
				return false;
			CallDef other = (CallDef) obj;
            if (this.GetHashCode() != other.GetHashCode())
                return false;
            //if (NomeDef == null) {
            //    if (other.NomeDef != null)
            //        return false;
            //} else if (!NomeDef.Equals(other.NomeDef))
            //    return false;
            //if (parValues == null) {
            //    if (other.parValues != null)
            //        return false;
            //} else if (this.parValues.GetHashCode() != other.parValues.GetHashCode())        //(!parValues.Equals(other.parValues))
            //    return false;
			return true;
		}

        public override string ToString()
        {
            StringBuilder retorno = new StringBuilder();
            retorno.Append(NomeDef);
            foreach(object obj in parValues)
            {
                retorno.Append(" ");
                retorno.Append(obj);
            }
            return retorno.ToString();
        }
    }
}
