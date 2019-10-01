using System;
using System.CodeDom.Compiler;
using System.Xml.Serialization;

namespace StampaRegistri.DocsPaWR305
{
	[GeneratedCode("System.Xml", "2.0.50727.42"), XmlType(Namespace = "http://localhost")]
	[Serializable]
	public enum RubricaCallType
	{
		CALLTYPE_PROTO_IN,
		CALLTYPE_PROTO_IN_INT,
		CALLTYPE_PROTO_OUT,
		CALLTYPE_TRASM_INF,
		CALLTYPE_TRASM_SUP,
		CALLTYPE_TRASM_ALL,
		CALLTYPE_MANAGE,
		CALLTYPE_PROTO_OUT_MITT,
		CALLTYPE_PROTO_INT_MITT,
		CALLTYPE_PROTO_INGRESSO,
		CALLTYPE_UFFREF_PROTO,
		CALLTYPE_GESTFASC_LOCFISICA,
		CALLTYPE_GESTFASC_UFFREF,
		CALLTYPE_EDITFASC_LOCFISICA,
		CALLTYPE_EDITFASC_UFFREF,
		CALLTYPE_NEWFASC_LOCFISICA,
		CALLTYPE_NEWFASC_UFFREF,
		CALLTYPE_RICERCA_MITTDEST,
		CALLTYPE_RICERCA_UFFREF,
		CALLTYPE_RICERCA_MITTINTERMEDIO,
		CALLTYPE_RICERCA_ESTESA,
		CALLTYPE_RICERCA_COMPLETAMENTO,
		CALLTYPE_RICERCA_TRASM,
		CALLTYPE_PROTO_INT_DEST
	}
}