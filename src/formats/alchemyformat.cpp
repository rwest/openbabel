/**********************************************************************
Copyright (C) 1998-2001 by OpenEye Scientific Software, Inc.
Some portions Copyright (c) 2001-2003 by Geoffrey R. Hutchison
Some portions Copyright (C) 2004 by Chris Morley

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation version 2 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
***********************************************************************/

#include "mol.h"
#include "obconversion.h"

using namespace std;
namespace OpenBabel {

class AlchemyFormat : public OBFormat
{
public:
	//Register this format type ID
	AlchemyFormat() {OBConversion::RegisterFormat("ALC",this);}

	virtual const char* Description() //required
	{ return
"Alchemy format\n \
No comments yet\n \
";
	};

	virtual const char* SpecificationURL(){return
		"http://??";}; //optional

	//Flags() can return be any the following combined by | or be omitted if none apply
	// NOTREADABLE  READONEONLY  NOTWRITABLE  WRITEONEONLY 
	virtual unsigned int Flags(){return READONEONLY;};

//*** This section identical for most OBMol conversions ***
	////////////////////////////////////////////////////
	/// The "API" interface functions
	virtual bool ReadMolecule(OBBase* pOb, OBConversion* pConv);
	virtual bool WriteMolecule(OBBase* pOb, OBConversion* pConv);

////////////////////////////////////////////////////
	/// The "Convert" interface functions
	virtual bool ReadChemObject(OBConversion* pConv)
	{
		OBMol* pmol = new OBMol;
		bool ret=ReadMolecule(pmol,pConv);
		if(ret) //Do transformation and return molecule
			pConv->AddChemObject(pmol->DoTransformations(pConv->GetGeneralOptions()));
		else
			pConv->AddChemObject(NULL);
		return ret;
	};
	
	virtual bool WriteChemObject(OBConversion* pConv)
	{
		//Retrieve the target OBMol
		OBBase* pOb = pConv->GetChemObject();
		OBMol* pmol = dynamic_cast<OBMol*> (pOb);
		bool ret=false;
		if(pmol)
			ret=WriteMolecule(pmol,pConv);
		delete pOb; 
		return ret;
	};
};
//***

//Make an instance of the format class
AlchemyFormat theAlchemyFormat;

/////////////////////////////////////////////////////////////////
bool AlchemyFormat::ReadMolecule(OBBase* pOb, OBConversion* pConv)
{

	OBMol* pmol = dynamic_cast<OBMol*>(pOb);
	if(pmol==NULL) return false;

	//Define some references so we can use the old parameter names
	istream &ifs = *pConv->GetInStream();
	OBMol &mol = *pmol;
	const char* title = pConv->GetTitle();

  int i;
  int natoms,nbonds;
  char buffer[BUFF_SIZE];

  ifs.getline(buffer,BUFF_SIZE);
  sscanf(buffer,"%d %*s %d", &natoms, &nbonds);
  if (!natoms) return(false);

  mol.ReserveAtoms(natoms);
  ttab.SetFromType("ALC");

  string str;
  double x,y,z;
  OBAtom *atom;
  vector<string> vs;

  for (i = 1; i <= natoms; i ++)
  {
    if (!ifs.getline(buffer,BUFF_SIZE)) return(false);
    tokenize(vs,buffer);
    if (vs.size() != 6) return(false);
    atom = mol.NewAtom();
    x = atof((char*)vs[2].c_str());
    y = atof((char*)vs[3].c_str());
    z = atof((char*)vs[4].c_str());
    atom->SetVector(x,y,z); //set coordinates

    //set atomic number
    ttab.SetToType("ATN"); ttab.Translate(str,vs[1]);
    atom->SetAtomicNum(atoi(str.c_str()));
    //set type
    ttab.SetToType("INT"); ttab.Translate(str,vs[1]); 
    atom->SetType(str);
  }

  char bobuf[100];
  string bostr;
  int bgn,end,order;

  for (i = 0; i < nbonds; i++)
  {
    if (!ifs.getline(buffer,BUFF_SIZE)) return(false);
    sscanf(buffer,"%*d%d%d%s",&bgn,&end,bobuf);
    bostr = bobuf; order = 1;
    if      (bostr == "DOUBLE")   order = 2;
    else if (bostr == "TRIPLE")   order = 3;
    else if (bostr == "AROMATIC") order = 5;
    mol.AddBond(bgn,end,order);
  }

  mol.SetTitle(title);
  return(true);
}

////////////////////////////////////////////////////////////////

bool AlchemyFormat::WriteMolecule(OBBase* pOb, OBConversion* pConv)
{
	OBMol* pmol = dynamic_cast<OBMol*>(pOb);
	if(pmol==NULL) return false;

	//Define some references so we can use the old parameter names
	ostream &ofs = *pConv->GetOutStream();
	OBMol &mol = *pmol;
	const char *dimension = pConv->GetDimension();

  unsigned int i;
  char buffer[BUFF_SIZE];
  char bond_string[10];
  
  snprintf(buffer, BUFF_SIZE, "%5d ATOMS, %5d BONDS,     0 CHARGES",
	  mol.NumAtoms(),
	  mol.NumBonds());
  ofs << buffer << endl;
  ttab.SetFromType("INT"); ttab.SetToType("ALC");

  OBAtom *atom;
  string str,str1;
  for(i = 1;i <= mol.NumAtoms(); i++)
  {
    atom = mol.GetAtom(i);
    str = atom->GetType();
    ttab.Translate(str1,str);
    snprintf(buffer, BUFF_SIZE, "%5d %-6s%8.4f %8.4f %8.4f     0.0000",
	    i,
	    (char*)str1.c_str(),
	    atom->GetX(),
	    atom->GetY(),
	    atom->GetZ());
    ofs << buffer << endl;
  }

  OBBond *bond;
  vector<OBEdgeBase*>::iterator j;

  for (bond = mol.BeginBond(j);bond;bond = mol.NextBond(j))
  {
    switch(bond->GetBO())
    {
    case 1 :  strcpy(bond_string,"SINGLE");  break;
    case 2 :  strcpy(bond_string,"DOUBLE");  break;
    case 3 :  strcpy(bond_string,"TRIPLE");  break;
    case 5 :  strcpy(bond_string,"AROMATIC"); break;
    default : strcpy(bond_string,"SINGLE");
    }
    snprintf(buffer, BUFF_SIZE, "%5d  %4d  %4d  %s",
	    bond->GetIdx()+1,
	    bond->GetBeginAtomIdx(),
	    bond->GetEndAtomIdx(),
	    bond_string);
    ofs << buffer << endl;
  }
  return(true);
}

} //namespace OpenBabel