/**********************************************************************
cifformat.cpp - Implementation of subclass of OBFormat for conversion of OBMol.

Copyright (C) 2006 Vincent Favre-Nicolin

This file is part of the Open Babel project.
For more information, see <http://openbabel.sourceforge.net/>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation version 2 of the License.
 
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
***********************************************************************/

#include <openbabel/babelconfig.h>
#include <openbabel/obmolecformat.h>
#include <openbabel/math/spacegroup.h>

#include <sstream>
#include <vector>
#include <list>
#include <map>
#include <set>

using namespace std;
namespace OpenBabel
{
  class CIFFormat : public OBMoleculeFormat
  {
  public:
    //Register this format type ID
    CIFFormat()
    {
      RegisterFormat("cif", "chemical/x-cif");
    }

    virtual const char* Description() //required
    {
      return
        "Crystallographic Information File\n\n"
        "Read Options e.g. -b:\n"
        "  v  Verbose CIF conversion\n"
        "  s  Output single bonds only\n"
        "  b  Disable bonding entirely\n"
        "  B  Use bonds listed in CIF file from _geom_bond_* records (overrides option b) \n\n";
    };

    virtual const char* SpecificationURL()
    {return "http://www.iucr.org/iucr-top/cif/spec/";}; //optional

    //*** This section identical for most OBMol conversions ***
    ////////////////////////////////////////////////////
    /// The "API" interface functions
    virtual bool ReadMolecule(OBBase* pOb, OBConversion* pConv);
    virtual bool WriteMolecule(OBBase* pOb, OBConversion* pConv);
  };
  //############################## Case-insensituve string####################################################
  // :TODO: This duplicates normal case-insensitive string comparison in OpenBabel
  /// Case-insensitive string class
  /// From: Guru of the Week #29
  /// e.g.: http://gcc.gnu.org/onlinedocs/libstdc++/21_strings/gotw29a.txt
  ///
  /// Public domain
  struct ci_char_traits : public std::char_traits<char>
  {
    static bool eq( char c1, char c2 );
   
    static bool ne( char c1, char c2 );
   
    static bool lt( char c1, char c2 );
   
    static int compare(const char* s1,const char* s2,size_t n );
   
    static const char* find( const char* s, int n, char a );
  };
   
  typedef std::basic_string<char, ci_char_traits> ci_string;
  int strnicmp(const char *s1, const char *s2, int len)
  {
    unsigned char c1, c2;
    while (len)
      {
        c1 = *s1; c2 = *s2;
        s1++; s2++;
        if (!c1) return c2 ? -1 : 0;
        if (!c2) return 1;
        if (c1 != c2)
          {
            c1 = tolower(c1);
            c2 = tolower(c2);
            if (c1 != c2) return c1 < c2 ? -1 : 1;
          }
        len--;
      }
    return 0;
  }
   
  bool ci_char_traits::eq( char c1, char c2 )
  {return tolower(c1) == tolower(c2);}
   
  bool ci_char_traits::ne( char c1, char c2 )
  {return tolower(c1) != tolower(c2);}
   
  bool ci_char_traits::lt( char c1, char c2 )
  {return tolower(c1) < tolower(c2);}
   
  int ci_char_traits::compare(const char* s1,const char* s2,size_t n )
  {return strnicmp( s1, s2, n );}
   
  const char* ci_char_traits::find( const char* s, int n, char a )
  {
    while( n-- > 0 && tolower(*s) != tolower(a) ) ++s;
    return s;
  }
  //############################## CIF CLASSES headers####################################################
  /** The CIFData class holds all the information from a \e single data_ block from a cif file.
   * 
   * It is a placeholder for all comments, item and loop data, as raw strings copied from
   * a cif file.
   *
   * It is also used to interpret this data to extract parts of the cif data, i.e.
   * only part of the core cif dictionnary are recognized. CIF tags currently recognized
   * include ("tag1 > tag2" means tag1 is preferred to tag2 when extracting the info, only one is reported):
   *  - crystal name: _chemical_name_systematic > _chemical_name_mineral > _chemical_name_structure_type > _chemical_name_common
   *  - crystal formula: _chemical_formula_analytical > _chemical_formula_structural > _chemical_formula_iupac > _chemical_formula_moiety
   *  - unit cell:  _cell_length_{a,b,c} ; _cell_angle_{alpha,beta,gamma}
   *  - spacegroup number: _space_group_IT_number > _symmetry_Int_Tables_number
   *  - spacegroup Hall symbol: _space_group_name_Hall > _symmetry_space_group_name_Hall
   *  - spacegroup Hermann-Mauguin symbol:_space_group_name_H-M_alt > _symmetry_space_group_name_H-M
   *  - atom coordinates: _atom_site_fract_{x} ; _atom_site_Cartn_{x,y,z}
   *  - atom occupancy: _atom_site_occupancy
   *  - atom label & symbol: _atom_site_type_symbol ; _atom_site_label
   *
   * Cartesian coordinates are stored in Angstroems, angles in radians.
   *
   * If another data field is needed, it is possible to directly access the string data 
   * (CIFData::mvComment , CIFData::mvItem and CIFData::mvLoop) to search for the correct tags.
   */
  class CIFData
  {
  public:
    CIFData();
         
    /// Extract lattice parameters, spacegroup (symbol or number), atomic positions,
    /// chemical name and formula if available.
    /// All other data is ignored
    void ExtractAll(const bool verbose=false);
    /// Extract name & formula for the crystal
    void ExtractName(const bool verbose=false);
    /// Extract unit cell
    void ExtractUnitCell(const bool verbose=false);
    /// Extract spacegroup number or symbol
    void ExtractSpacegroup(const bool verbose=false);
    /// Extract all atomic positions. Will generate cartesian from fractional
    /// coordinates or vice-versa if only cartesian coordinates are available.
    void ExtractAtomicPositions(const bool verbose=false);
    /// Extract listed bond distances, from _geom_bond_* loops
    void ExtractBonds(const bool verbose=false);
    /// Generate fractional coordinates from cartesian ones for all atoms
    /// CIFData::CalcMatrices() must be called first
    void Cartesian2FractionalCoord();
    /// Generate cartesian coordinates from fractional ones for all atoms
    /// CIFData::CalcMatrices() must be called first
    void Fractional2CartesianCoord();
    /// Convert from fractional to cartesian coordinates
    /// CIFData::CalcMatrices() must be called first
    void f2c(float &x,float &y, float &z);
    /// Convert from cartesia to fractional coordinates
    /// CIFData::CalcMatrices() must be called first
    void c2f(float &x,float &y, float &z);
    /// Calculate real space transformation matrices
    /// requires unit cell parameters
    void CalcMatrices(const bool verbose=false);
    /// Comments from CIF file, in the order they were read
    std::list<std::string> mvComment;
    /// Individual CIF items
    std::map<ci_string,std::string> mvItem;
    /// CIF Loop data
    std::map<std::set<ci_string>,std::map<ci_string,std::vector<std::string> > > mvLoop;
    /// Lattice parameters, in ansgtroem and degrees - vector size is 0 if no
    /// parameters have been obtained yet.
    std::vector<float> mvLatticePar;
    /// Spacegroup number from International Tables (_space_group_IT_number), or -1.
    unsigned int mSpacegroupNumberIT;
    /// Spacegroup Hall symbol (or empty string) (_space_group_name_Hall)
    std::string mSpacegroupSymbolHall;
    /// Spacegroup Hermann-Mauguin symbol (or empty string) (_space_group_name_H-M_alt)
    std::string mSpacegroupHermannMauguin;
    /// Crystal name. Or empty string if none is available.
    std::string mName;
    /// Formula. Or empty string if none is available.
    std::string mFormula;
    /// Atom record 
    struct CIFAtom
    {
      CIFAtom();
      /// Label of the atom, or empty string (_atom_site_label).
      std::string mLabel;
      /// Symbol of the atom, or empty string (_atom_type_symbol or _atom_site_type_symbol).
      std::string mSymbol;
      /// Fractionnal coordinates (_atom_site_fract_{x,y,z}) or empty vector.
      std::vector<float> mCoordFrac;
      /// Cartesian coordinates in Angstroem (_atom_site_Cartn_{x,y,z}) or empty vector.
      /// Transformation to fractionnal coordinates currently assumes 
      /// "a parallel to x; b in the plane of y and z" (see _atom_sites_Cartn_transform_axes)
      std::vector<float> mCoordCart;
      /// Site occupancy, or -1
      float mOccupancy;
    };
    /// Atoms, if any are found
    std::vector<CIFAtom> mvAtom;
    /// Bond distance record
    struct CIFBond
    {
      /// Label of the two bonded atoms
      std::string mLabel1,mLabel2;
      /// distance
      float mDistance;
    };
    /// Atoms, if any are found
    std::vector<CIFBond> mvBond;
    /// Fractionnal2Cartesian matrix
    float mOrthMatrix[3][3];
    /// Cartesian2Fractionnal matrix
    float mOrthMatrixInvert[3][3];
    const SpaceGroup *mSpaceGroup;
  };
  /** Main CIF class - parses the stream and separates data blocks, comments, items, loops.
   * All values are stored as string, and Each CIF block is stored in a separate CIFData object.
   * No interpretaion is made here - this must be done from all CIFData objects.
   */
  class CIF
  {
  public:
    /// Creates the CIF object from a stream
    ///
    /// \param interpret: if true, interpret all data blocks. See CIFData::ExtractAll()
    CIF(std::istream &in, const bool interpret=true,const bool verbose=false);
    //private:
    /// Separate the file in data blocks and parse them to sort tags, loops and comments.
    /// All is stored in the original strings.
    void Parse(std::stringstream &in);
    /// The data blocks, after parsing. The key is the name of the data block
    std::map<std::string,CIFData> mvData;
    /// Global comments, outside and data block
    std::list<std::string> mvComment;
  };
  /// Convert one CIF value to a floating-point value
  /// Return 0 if no value can be converted (e.g. if '.' or '?' is encountered)
  float CIFNumeric2Float(const std::string &s);
  /// Convert one CIF value to a floating-point value
  /// Return 0 if no value can be converted (e.g. if '.' or '?' is encountered)
  int CIFNumeric2Int(const std::string &s);

  //############################## CIF CLASSES CODE ####################################################
  CIFData::CIFAtom::CIFAtom():
    mLabel(""),mSymbol(""),mOccupancy(1.0)
  {}
   
  CIFData::CIFData()
  {}
   
  void CIFData::ExtractAll(const bool verbose)
  {
    // :TODO: Take care of values listed as "." and "?" instead of a real value.
    this->ExtractName(verbose);
    this->ExtractUnitCell(verbose);
    this->ExtractSpacegroup(verbose);
    this->ExtractAtomicPositions(verbose);
    this->ExtractBonds(verbose);
  }
   
  void CIFData::ExtractUnitCell(const bool verbose)
  {
    map<ci_string,string>::const_iterator positem;
    positem=mvItem.find("_cell_length_a");
    if(positem!=mvItem.end())
      {
        mvLatticePar.resize(6);
        mvLatticePar[0]=CIFNumeric2Float(positem->second);
        positem=mvItem.find("_cell_length_b");
        if(positem!=mvItem.end())
          mvLatticePar[1]=CIFNumeric2Float(positem->second);
        positem=mvItem.find("_cell_length_c");
        if(positem!=mvItem.end())
          mvLatticePar[2]=CIFNumeric2Float(positem->second);
        positem=mvItem.find("_cell_angle_alpha");
        if(positem!=mvItem.end())
          mvLatticePar[3]=CIFNumeric2Float(positem->second);
        positem=mvItem.find("_cell_angle_beta");
        if(positem!=mvItem.end())
          mvLatticePar[4]=CIFNumeric2Float(positem->second);
        positem=mvItem.find("_cell_angle_gamma");
        if(positem!=mvItem.end())
          mvLatticePar[5]=CIFNumeric2Float(positem->second);
        if(verbose) cout<<"Found Lattice parameters:" <<mvLatticePar[0]<<" , "<<mvLatticePar[1]<<" , "<<mvLatticePar[2]
                        <<" , "<<mvLatticePar[3]<<" , "<<mvLatticePar[4]<<" , "<<mvLatticePar[5]<<endl;
        mvLatticePar[3]*=DEG_TO_RAD;// pi/180
        mvLatticePar[4]*=DEG_TO_RAD;
        mvLatticePar[5]*=DEG_TO_RAD;
        this->CalcMatrices();
      }
  }
   
  void CIFData::ExtractSpacegroup(const bool verbose)
  {
    map<ci_string,string>::const_iterator positem;
    bool found = false;
    positem=mvItem.find("_space_group_IT_number");
    if(positem!=mvItem.end())
      {
        mSpacegroupNumberIT=CIFNumeric2Int(positem->second);
        found = true;
        if(verbose) cout<<"Found spacegroup IT number:"<<mSpacegroupNumberIT<<endl;
      }
    else
      {
        positem=mvItem.find("_symmetry_Int_Tables_number");
        if(positem!=mvItem.end())
          {
            mSpacegroupNumberIT=CIFNumeric2Int(positem->second);
            found = true;
            if(verbose) cout<<"Found spacegroup IT number (with OBSOLETE CIF #1.0 TAG):"<<mSpacegroupNumberIT<<endl;
          }
        else
          mSpacegroupNumberIT=0;
      }
      
    positem=mvItem.find("_space_group_name_Hall");
    if(positem!=mvItem.end())
      {
        mSpacegroupSymbolHall=positem->second;
        found = true;
        if(verbose) cout<<"Found spacegroup Hall symbol:"<<mSpacegroupSymbolHall<<endl;
      }
    else
      {
        positem=mvItem.find("_symmetry_space_group_name_Hall");
        if(positem!=mvItem.end())
          {
            mSpacegroupSymbolHall=positem->second;
            found = true;
            if(verbose) cout<<"Found spacegroup Hall symbol (with OBSOLETE CIF #1.0 TAG):"<<mSpacegroupSymbolHall<<endl;
          }
      }
      
    positem=mvItem.find("_space_group_name_H-M_alt");
    if(positem!=mvItem.end())
      {
        mSpacegroupHermannMauguin=positem->second;
        found = true;
        if(verbose) cout<<"Found spacegroup Hermann-Mauguin symbol:"<<mSpacegroupHermannMauguin<<endl;
      }
    else
      {
        positem=mvItem.find("_symmetry_space_group_name_H-M");
        if(positem!=mvItem.end())
          {
            mSpacegroupHermannMauguin=positem->second;
            found = true;
            if(verbose) cout<<"Found spacegroup Hermann-Mauguin symbol (with OBSOLETE CIF #1.0 TAG):"<<mSpacegroupHermannMauguin<<endl;
          }
      }
    if (mSpacegroupSymbolHall.length() > 0)
      mSpaceGroup = SpaceGroup::GetSpaceGroup(mSpacegroupSymbolHall);
    else
      mSpaceGroup=NULL;
    if (!mSpaceGroup && mSpacegroupHermannMauguin.length() > 0)
      mSpaceGroup = SpaceGroup::GetSpaceGroup(mSpacegroupHermannMauguin);
    if (!mSpaceGroup)
      mSpaceGroup = SpaceGroup::GetSpaceGroup(mSpacegroupNumberIT);
    SpaceGroup *sg = new SpaceGroup();
    if (mSpacegroupSymbolHall.length() > 0)
      sg->SetHallName(mSpacegroupSymbolHall);
    if (mSpacegroupHermannMauguin.length() > 0)
      sg->SetHMName(mSpacegroupHermannMauguin);
    if (mSpacegroupNumberIT > 0)
      sg->SetId(mSpacegroupNumberIT);
    positem=mvItem.find("_symmetry_equiv_pos_as_xyz");
    if(positem!=mvItem.end())
      {
        sg->AddTransform (positem->second);
        found = true;
      }
    else for(map<set<ci_string>,map<ci_string,vector<string> > >::const_iterator loop=mvLoop.begin();
      loop!=mvLoop.end();++loop)
      {
        map<ci_string,vector<string> >::const_iterator pos;
        unsigned i, nb;
        pos=loop->second.find("_symmetry_equiv_pos_as_xyz");
        if (pos!=loop->second.end())
          {
            nb=pos->second.size();
            found = true;
            for (i = 0; i < nb; i++)
              sg->AddTransform(pos->second[i]);
            break; // found the transforms, so we have done with them
          }
    }
    if (found)
      mSpaceGroup = SpaceGroup::Find(sg);
    delete sg;
    if (mSpaceGroup != NULL)
      // set the space group name to Hall symbol
      mSpacegroupSymbolHall = mSpaceGroup->GetHallName();
  }
   
  void CIFData::ExtractName(const bool verbose)
  {
    map<ci_string,string>::const_iterator positem;
    positem=mvItem.find("_chemical_name_systematic");
    if(positem!=mvItem.end())
      {
        mName=positem->second;
        if(verbose) cout<<"Found chemical name:"<<mName<<endl;
      }
    else
      {
        positem=mvItem.find("_chemical_name_mineral");
        if(positem!=mvItem.end())
          {
            mName=positem->second;
            if(verbose) cout<<"Found chemical name:"<<mName<<endl;
          }
        else
          {
            positem=mvItem.find("_chemical_name_structure_type");
            if(positem!=mvItem.end())
              {
                mName=positem->second;
                if(verbose) cout<<"Found chemical name:"<<mName<<endl;
              }
            else
              {
                positem=mvItem.find("_chemical_name_common");
                if(positem!=mvItem.end())
                  {
                    mName=positem->second;
                    if(verbose) cout<<"Found chemical name:"<<mName<<endl;
                  }
              }
          }
      }
    /// Crystal formula
    positem=mvItem.find("_chemical_formula_analytical");
    if(positem!=mvItem.end())
      {
        mFormula=positem->second;
        if(verbose) cout<<"Found chemical formula:"<<mFormula<<endl;
      }
    else
      {
        positem=mvItem.find("_chemical_formula_structural");
        if(positem!=mvItem.end())
          {
            mFormula=positem->second;
            if(verbose) cout<<"Found chemical formula:"<<mFormula<<endl;
          }
        else
          {
            positem=mvItem.find("_chemical_formula_iupac");
            if(positem!=mvItem.end())
              {
                mFormula=positem->second;
                if(verbose) cout<<"Found chemical formula:"<<mFormula<<endl;
              }
            else
              {
                positem=mvItem.find("_chemical_formula_moiety");
                if(positem!=mvItem.end())
                  {
                    mFormula=positem->second;
                    if(verbose) cout<<"Found chemical formula:"<<mFormula<<endl;
                  }
              }
          }
      }
  }
   
  void CIFData::ExtractAtomicPositions(const bool verbose)
  {
    map<ci_string,string>::const_iterator positem;
    for(map<set<ci_string>,map<ci_string,vector<string> > >::const_iterator loop=mvLoop.begin();
        loop!=mvLoop.end();++loop)
      {
        if(mvAtom.size()>0) break;// only extract ONE list of atoms, preferably fractional coordinates
        map<ci_string,vector<string> >::const_iterator posx,posy,posz,poslabel,possymbol,posoccup;
        posx=loop->second.find("_atom_site_fract_x");
        posy=loop->second.find("_atom_site_fract_y");
        posz=loop->second.find("_atom_site_fract_z");
        unsigned int nb;
        if( (posx!=loop->second.end()) && (posy!=loop->second.end()) && (posz!=loop->second.end()))
          {
            nb=posx->second.size();
            mvAtom.resize(nb);
            for(unsigned int i=0;i<nb;++i)
              {
                mvAtom[i].mCoordFrac.resize(3);
                mvAtom[i].mCoordFrac[0]=CIFNumeric2Float(posx->second[i]);
                mvAtom[i].mCoordFrac[1]=CIFNumeric2Float(posy->second[i]);
                mvAtom[i].mCoordFrac[2]=CIFNumeric2Float(posz->second[i]);
              }
            this->Fractional2CartesianCoord();
          }
        else
          {
            posx=loop->second.find("_atom_site_Cartn_x");
            posy=loop->second.find("_atom_site_Cartn_y");
            posz=loop->second.find("_atom_site_Cartn_z");
            if( (posx!=loop->second.end()) && (posy!=loop->second.end()) && (posz!=loop->second.end()))
              {
                nb=posx->second.size();
                mvAtom.resize(nb);
                for(unsigned int i=0;i<nb;++i)
                  {
                    mvAtom[i].mCoordCart.resize(3);
                    mvAtom[i].mCoordCart[0]=CIFNumeric2Float(posx->second[i]);
                    mvAtom[i].mCoordCart[1]=CIFNumeric2Float(posy->second[i]);
                    mvAtom[i].mCoordCart[2]=CIFNumeric2Float(posz->second[i]);
                  }
                this->Cartesian2FractionalCoord();
              }
          }
        if(mvAtom.size()>0)
          {// Got the atoms, get names and symbols
            possymbol=loop->second.find("_atom_site_type_symbol");
            if(possymbol!=loop->second.end())
              for(unsigned int i=0;i<nb;++i)
                mvAtom[i].mSymbol=possymbol->second[i];
            poslabel=loop->second.find("_atom_site_label");
            if(poslabel!=loop->second.end())
              for(unsigned int i=0;i<nb;++i)
                {
                  mvAtom[i].mLabel=poslabel->second[i];
                  if(possymbol==loop->second.end())
                    {// There was no symbol, use the labels to guess it
                      int nbc=0;
                      if(mvAtom[i].mLabel.size()==1)
                        if(isalpha(mvAtom[i].mLabel[0])) nbc=1;
                      if(mvAtom[i].mLabel.size()>=2)
                        {
                          if(isalpha(mvAtom[i].mLabel[0]) && isalpha(mvAtom[i].mLabel[1])) nbc=2;
                          else if(isalpha(mvAtom[i].mLabel[0])) nbc=1;
                        }
                      if(nbc>0) mvAtom[i].mSymbol=mvAtom[i].mLabel.substr(0,nbc);
                      else mvAtom[i].mSymbol="H";//Something wen wrong, no symbol !
                    }
                }
            // Occupancy ?
            posoccup=loop->second.find("atom_site_occupancy");
            if(posoccup!=loop->second.end())
              for(unsigned int i=0;i<nb;++i)
                mvAtom[i].mOccupancy=CIFNumeric2Float(posoccup->second[i]);
            // Now be somewhat verbose
            if(verbose)
              {
                cout << "Found "<<nb<<" atoms."<<endl;
                for(unsigned int i=0;i<nb;++i)
                  {
                    cout<<mvAtom[i].mLabel<<" "<<mvAtom[i].mSymbol;
                    if(mvAtom[i].mCoordFrac.size()>0)
                      {
                        cout<<" , Fractional: ";
                        for(unsigned int j=0;j<mvAtom[i].mCoordFrac.size();++j)
                          cout<<mvAtom[i].mCoordFrac[j]<<" ";
                      }
                    if(mvAtom[i].mCoordCart.size()>0)
                      {
                        cout<<" , Cartesian: ";
                        for(unsigned int j=0;j<mvAtom[i].mCoordCart.size();++j)
                          cout<<mvAtom[i].mCoordCart[j]<<" ";
                      }
                    cout<<" , Occupancy= "<<mvAtom[i].mOccupancy<<endl;
                  }
              }
          }
      }
  }

  void CIFData::ExtractBonds(const bool verbose)
  {
    map<ci_string,string>::const_iterator positem;
    for(map<set<ci_string>,map<ci_string,vector<string> > >::const_iterator loop=mvLoop.begin(); loop!=mvLoop.end();++loop)
      {
        //if(mvBond.size()>0) break;// Only allow one bond list
        map<ci_string,vector<string> >::const_iterator poslabel1,poslabel2,posdist;
        poslabel1=loop->second.find("_geom_bond_atom_site_label_1");
        poslabel2=loop->second.find("_geom_bond_atom_site_label_2");
        posdist=loop->second.find("_geom_bond_distance");
        if( (poslabel1!=loop->second.end()) && (poslabel2!=loop->second.end()) && (posdist!=loop->second.end()))
          {
            if(verbose) cout<<"Found _geom_bond* record..."<<endl;
            const unsigned long nb=poslabel1->second.size();
            mvBond.resize(nb);
            for(unsigned int i=0;i<nb;++i)
              {
                mvBond[i].mLabel1=poslabel1->second[i];
                mvBond[i].mLabel2=poslabel2->second[i];
                mvBond[i].mDistance=CIFNumeric2Float(posdist->second[i]);
                if(verbose) cout<<"  d("<<mvBond[i].mLabel1<<"-"<<mvBond[i].mLabel2<<")="<<mvBond[i].mDistance<<endl;
              }
          }
      }
  }

  void CIFData::CalcMatrices(const bool verbose)
  {
    if(mvLatticePar.size()==0) return;//:TODO: throw error
    float a,b,c,alpha,beta,gamma;//direct space parameters
    float aa,bb,cc,alphaa,betaa,gammaa;//reciprocal space parameters
    float v;//volume of the unit cell
    a=mvLatticePar[0];
    b=mvLatticePar[1];
    c=mvLatticePar[2];
    alpha=mvLatticePar[3];
    beta=mvLatticePar[4];
    gamma=mvLatticePar[5];
      
    v=sqrt(1-cos(alpha)*cos(alpha)-cos(beta)*cos(beta)-cos(gamma)*cos(gamma)
           +2*cos(alpha)*cos(beta)*cos(gamma));
      
    aa=sin(alpha)/a/v;
    bb=sin(beta )/b/v;
    cc=sin(gamma)/c/v;
      
    alphaa=acos( (cos(beta )*cos(gamma)-cos(alpha))/sin(beta )/sin(gamma) );
    betaa =acos( (cos(alpha)*cos(gamma)-cos(beta ))/sin(alpha)/sin(gamma) );
    gammaa=acos( (cos(alpha)*cos(beta )-cos(gamma))/sin(alpha)/sin(beta ) );
      
    mOrthMatrix[0][0]=a;
    mOrthMatrix[0][1]=b*cos(gamma);
    mOrthMatrix[0][2]=c*cos(beta);
      
    mOrthMatrix[1][0]=0;
    mOrthMatrix[1][1]=b*sin(gamma);
    mOrthMatrix[1][2]=-c*sin(beta)*cos(alphaa);
      
    mOrthMatrix[2][0]=0;
    mOrthMatrix[2][1]=0;
    mOrthMatrix[2][2]=1/cc;
      
    // Invert upper triangular matrix
    float cm[3][3];
    cm[0][0]=mOrthMatrix[0][0];
    cm[0][1]=mOrthMatrix[0][1];
    cm[0][2]=mOrthMatrix[0][2];
      
    cm[1][0]=mOrthMatrix[1][0];
    cm[1][1]=mOrthMatrix[1][1];
    cm[1][2]=mOrthMatrix[1][2];
      
    cm[2][0]=mOrthMatrix[2][0];
    cm[2][1]=mOrthMatrix[2][1];
    cm[2][2]=mOrthMatrix[2][2];
    for(long i=0;i<3;i++)
      for(long j=0;j<3;j++)
        if(i==j) mOrthMatrixInvert[i][j]=1;
        else mOrthMatrixInvert[i][j]=0;
    for(long i=0;i<3;i++)
      {
        float a;
        for(long j=i-1;j>=0;j--)
          {
            a=cm[j][i]/cm[i][i];
            for(long k=0;k<3;k++) mOrthMatrixInvert[j][k] -= mOrthMatrixInvert[i][k]*a;
            for(long k=0;k<3;k++) cm[j][k] -= cm[i][k]*a;
          }
        a=cm[i][i];
        for(long k=0;k<3;k++) mOrthMatrixInvert[i][k] /= a;
        for(long k=0;k<3;k++) cm[i][k] /= a;
      }
    if(verbose)
      {
        cout <<"Fractional2Cartesian matrix:"<<endl
             <<mOrthMatrix[0][0]<<" "<<mOrthMatrix[0][1]<<" "<<mOrthMatrix[0][2]<<endl
             <<mOrthMatrix[1][0]<<" "<<mOrthMatrix[1][1]<<" "<<mOrthMatrix[1][2]<<endl
             <<mOrthMatrix[2][0]<<" "<<mOrthMatrix[2][1]<<" "<<mOrthMatrix[2][2]<<endl<<endl;
        /*
          cout <<cm[0][0]<<" "<<cm[0][1]<<" "<<cm[0][2]<<endl
          <<cm[1][0]<<" "<<cm[1][1]<<" "<<cm[1][2]<<endl
          <<cm[2][0]<<" "<<cm[2][1]<<" "<<cm[2][2]<<endl<<endl;
        */
        cout <<"Cartesian2Fractional matrix:"<<endl
             <<mOrthMatrixInvert[0][0]<<" "<<mOrthMatrixInvert[0][1]<<" "<<mOrthMatrixInvert[0][2]<<endl
             <<mOrthMatrixInvert[1][0]<<" "<<mOrthMatrixInvert[1][1]<<" "<<mOrthMatrixInvert[1][2]<<endl
             <<mOrthMatrixInvert[2][0]<<" "<<mOrthMatrixInvert[2][1]<<" "<<mOrthMatrixInvert[2][2]<<endl<<endl;
      }
  }
   
  void CIFData::f2c(float &x,float &y, float &z)
  {
    const float x0=x,y0=y,z0=z;
    x=mOrthMatrix[0][0]*x0+mOrthMatrix[0][1]*y0+mOrthMatrix[0][2]*z0;
    y=mOrthMatrix[1][0]*x0+mOrthMatrix[1][1]*y0+mOrthMatrix[1][2]*z0;
    z=mOrthMatrix[2][0]*x0+mOrthMatrix[2][1]*y0+mOrthMatrix[2][2]*z0;
  }
   
  void CIFData::c2f(float &x,float &y, float &z)
  {
    const float x0=x,y0=y,z0=z;
    x=mOrthMatrixInvert[0][0]*x0+mOrthMatrixInvert[0][1]*y0+mOrthMatrixInvert[0][2]*z0;
    y=mOrthMatrixInvert[1][0]*x0+mOrthMatrixInvert[1][1]*y0+mOrthMatrixInvert[1][2]*z0;
    z=mOrthMatrixInvert[2][0]*x0+mOrthMatrixInvert[2][1]*y0+mOrthMatrixInvert[2][2]*z0;
  }
   
  void CIFData::Cartesian2FractionalCoord()
  {
    if(mvLatticePar.size()==0) return;//:TODO: report error
    for(vector<CIFAtom>::iterator pos=mvAtom.begin();pos!=mvAtom.end();++pos)
      {
        pos->mCoordFrac.resize(3);
        pos->mCoordFrac[0]=pos->mCoordCart.at(0);
        pos->mCoordFrac[1]=pos->mCoordCart.at(1);
        pos->mCoordFrac[2]=pos->mCoordCart.at(2);
        c2f(pos->mCoordFrac[0],pos->mCoordFrac[1],pos->mCoordFrac[2]);
      }
  }
   
  void CIFData::Fractional2CartesianCoord()
  {
    if(mvLatticePar.size()==0) return;//:TODO: report error
    for(vector<CIFAtom>::iterator pos=mvAtom.begin();pos!=mvAtom.end();++pos)
      {
        pos->mCoordCart.resize(3);
        pos->mCoordCart[0]=pos->mCoordFrac.at(0);
        pos->mCoordCart[1]=pos->mCoordFrac.at(1);
        pos->mCoordCart[2]=pos->mCoordFrac.at(2);
        f2c(pos->mCoordCart[0],pos->mCoordCart[1],pos->mCoordCart[2]);
      }
  }
   
  ///// 
   
   
  CIF::CIF(istream &is, const bool interpret,const bool verbose)
  {
    //Copy to an iostream so that we can put back characters if necessary
    stringstream in;
    char c;
    while(is.get(c))in.put(c);
    this->Parse(in);
    // Extract structure from blocks
    if(interpret)
      for(map<string,CIFData>::iterator posd=mvData.begin();posd!=mvData.end();++posd)
        posd->second.ExtractAll(verbose);
  }
   
  bool iseol(const char c) { return ((c=='\n')||(c=='\r'));}
   
  /// Read one value, whether it is numeric, string or text
  string CIFReadValue(stringstream &in,char &lastc)
  {
    bool vv=false;//very verbose ?
    string value;
    while(!isgraph(in.peek())) in.get(lastc);
    while(in.peek()=='#')
      {//discard these comments for now
        string tmp;
        getline(in,tmp);
        lastc='\r';
        while(!isgraph(in.peek())) in.get(lastc);
      }
    if(in.peek()==';')
      {//SemiColonTextField
        bool warning=!iseol(lastc);
        if(warning)
          cout<<"WARNING: Trying to read a SemiColonTextField but last char is not an end-of-line char !"<<endl;
        value="";
        in.get(lastc);
        while(in.peek()!=';')
          {
            if (in.peek() == '_') {
              cout << "WARNING: Trying to read a SemiColonTextField but found a new tag !" << endl;
              warning = true;
              break;
            }
            string tmp;
            getline(in,tmp);
            value+=tmp+" ";
          }
        if (!warning)
          in.get(lastc);
        if(vv) cout<<"SemiColonTextField:"<<value<<endl;
        if(warning && !vv) cout<<"SemiColonTextField:"<<value<<endl;
        return value;
      }
    if((in.peek()=='\'') || (in.peek()=='\"'))
      {//QuotedString
        char delim;
        in.get(delim);
        value="";
        while(!((lastc==delim)&&(!isgraph(in.peek()))) )
          {
            in.get(lastc);
            value+=lastc;
          }
        if(vv) cout<<"QuotedString:"<<value<<endl;
        return value.substr(0,value.size()-1);
      }
    // If we got here, we have an ordinary value, numeric or unquoted string
    in>>value;
    if(vv) cout<<"NormalValue:"<<value<<endl;
    return value;
  }
   
  void CIF::Parse(stringstream &in)
  {
    bool vv=false;//very verbose ?
    char lastc=' ';
    string block="";// Current block data
    while(!in.eof())
      {
        while(!isgraph(in.peek()) && !in.eof()) in.get(lastc);
        if(vv) cout<<endl;
        if(in.peek()=='#')
          {//Comment
            string tmp;
            getline(in,tmp);
            if(block=="") mvComment.push_back(tmp);
            else mvData[block].mvComment.push_back(tmp);
            lastc='\r';
            continue;
          }
        if(in.peek()=='_')
          {//Tag
            string tag,value;
            in>>tag;
            // Convert all dots to underscores to cover much of DDL2 with this DDL1 parser.
            for (string::size_type pos = tag.find('.'); pos != string::npos; pos = tag.find('.', ++ pos))
              tag.replace(pos, 1, 1, '_');
            value=CIFReadValue(in,lastc);
            mvData[block].mvItem[ci_string(tag.c_str())]=value;
            if(vv)cout<<"New Tag:"<<tag<<" ("<<value.size()<<"):"<<value<<endl;
            continue;
          }
        if((in.peek()=='d') || (in.peek()=='D'))
          {// Data
            string tmp;
            in>>tmp;
            block=tmp.substr(5);
            if(vv) cout<<endl<<endl<<"NEW BLOCK DATA: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ->"<<block<<endl<<endl<<endl;
            mvData[block]=CIFData();
            continue;
          }
        if((in.peek()=='l') || (in.peek()=='L'))
          {// loop_
            vector<ci_string> tit;
            string tmp;
            in>>tmp; //should be loop_
            if(vv) cout<<"LOOP : "<<tmp;
            while(true)
              {//read titles
                while(!isgraph(in.peek()) && !in.eof()) in.get(lastc);
                if(in.peek()=='#')
                  {
                    getline(in,tmp);
                    if(block=="") mvComment.push_back(tmp);
                    else mvData[block].mvComment.push_back(tmp);
                    continue;
                  }
                if(in.peek()!='_')
                  {
                    if(vv) cout<<endl<<"End of loop titles:"<<(char)in.peek()<<endl;
                    break;
                  }
                in>>tmp;
                // Convert all dots to underscores to cover much of DDL2 with this DDL1 parser.
                for (string::size_type pos = tmp.find('.'); pos != string::npos; pos = tmp.find('.', ++ pos))
                  tmp.replace(pos, 1, 1, '_');
                tit.push_back(ci_string(tmp.c_str()));
                if(vv) cout<<" , "<<tmp;
              }
            if(vv) cout<<endl;
            map<ci_string,vector<string> > lp;
            while(true)
              {
                while(!isgraph(in.peek()) && !in.eof()) in.get(lastc);
                if(in.eof()) break;
                if(vv) cout<<"LOOP VALUES...: "<<(char)in.peek()<<" "<<endl;
                if(in.peek()=='_') break;
                if(in.peek()=='#')
                  {// Comment (in a loop ??)
                    const std::ios::pos_type pos=in.tellg();
                    string tmp;
                    getline(in,tmp);
                    if(block=="") mvComment.push_back(tmp);
                    else mvData[block].mvComment.push_back(tmp);
                    lastc='\r';
                    if(vv) cout<<"Comment in a loop (?):"<<tmp<<endl;
                    in.seekg(pos);
                    break;
                  }
                const std::ios::pos_type pos=in.tellg();
                in>>tmp;
                if(vv) cout<<"WHATNEXT? "<<tmp;
                if(ci_string(tmp.c_str())=="loop_")
                  {//go back and continue
                    if(vv) cout<<endl<<"END OF LOOP :"<<tmp<<endl;
                    in.seekg(pos);
                    break;
                  }
                if(tmp.size()>=5)
                  if(ci_string(tmp.substr(0,5).c_str())=="data_")
                    {//go back and continue
                      if(vv) cout<<endl<<"END OF LOOP :"<<tmp<<endl;
                      in.seekg(pos);
                      break;
                    }
                // go back
                in.seekg(pos);
                for(unsigned int i=0;i<tit.size();++i)
                  {//Read all values
                    const string value=CIFReadValue(in,lastc);
                    lp[tit[i]].push_back(value);
                    if(vv) cout<<"     #"<<i<<" :  "<<value<<endl;
                  }
              }
            // The key to the mvLoop map is the set of column titles
            set<ci_string> stit;
            for(unsigned int i=0;i<tit.size();++i) stit.insert(tit[i]);
            mvData[block].mvLoop[stit]=lp;
            continue;
          }
        // If we get here, something went wrong ! Discard till end of line...
        string junk;
        getline(in,junk);
        cout<<"WARNING: did not understand : "<<junk<<endl;
      }
  }
   
  float CIFNumeric2Float(const string &s)
  {
    if((s==".") || (s=="?")) return 0.0;
    float v;
    const int n=sscanf(s.c_str(),"%f",&v);
    if(n!=1) return 0.0;
    return v;
  }
   
  int CIFNumeric2Int(const string &s)
  {
    if((s==".") || (s=="?")) return 0;
    int v;
    const int n=sscanf(s.c_str(),"%d",&v);
    if(n!=1) return 0;
    return v;
  }

  //############################## END CIF CLASSES####################################################

  //Make an instance of the format class
  CIFFormat theCIFFormat;

  /////////////////////////////////////////////////////////////////
  bool CIFFormat::ReadMolecule(OBBase* pOb, OBConversion* pConv)
  {
    OBMol* pmol = dynamic_cast<OBMol*>(pOb);
    if(pmol==NULL)
      return false;
    bool verbose=false;
    if (pConv->IsOption("v",OBConversion::INOPTIONS)) verbose=true;

    CIF cif(*pConv->GetInStream(),true,verbose);
    // Loop on all data blocks until we find one structure :TODO: handle multiple structures
    for(map<string,CIFData>::iterator pos=cif.mvData.begin();pos!=cif.mvData.end();++pos)
      if(pos->second.mvAtom.size()>0)
        {
          if(pos->second.mvLatticePar.size()==6)
            {// We have one unit cell
              string spg=pos->second.mSpacegroupSymbolHall;
              if(spg=="") spg=pos->second.mSpacegroupHermannMauguin;
              if(spg=="") spg=pos->second.mSpacegroupNumberIT;
              if(spg=="") spg="P1";
              OBUnitCell *pCell=new OBUnitCell;
              pCell->SetOrigin(fileformatInput);
              pCell->SetData(pos->second.mvLatticePar[0],
                             pos->second.mvLatticePar[1],
                             pos->second.mvLatticePar[2],
                             pos->second.mvLatticePar[3]/DEG_TO_RAD,
                             pos->second.mvLatticePar[4]/DEG_TO_RAD,
                             pos->second.mvLatticePar[5]/DEG_TO_RAD);
              pCell->SetSpaceGroup(spg);
              pCell->SetSpaceGroup(pos->second.mSpaceGroup);
              pmol->SetData(pCell);
            }
          if(pos->second.mName!="") pmol->SetTitle(pos->second.mName);
          else
            if(pos->second.mFormula!="") pmol->SetTitle(pos->second.mFormula);
            else pmol->SetTitle(pConv->GetTitle());

          if(pos->second.mFormula!="") pmol->SetFormula(pos->second.mFormula);

          // Keep a map linking the cif atom label to the obatom*, for bond interpretation later
          std::map<std::string,OBAtom *> vLabelOBatom;
          
          const unsigned int nbatoms=pos->second.mvAtom.size();
          pmol->ReserveAtoms(nbatoms);
          for(vector<CIFData::CIFAtom>::const_iterator posat=pos->second.mvAtom.begin();posat!=pos->second.mvAtom.end();++posat)
            {
              // Problem: posat->mSymbol is not guaranteed to actually be a symbol
              // see http://www.iucr.org/iucr-top/cif/cifdic_html/1/cif_core.dic/Iatom_type_symbol.html
              // Try to strip the string to have a better chance to have a valid symbol
              // This is not guaranteed to work still, as the CIF standard allows about any string...
              string tmpSymbol=posat->mSymbol;
              int nbc=0;
              if((tmpSymbol.size()==1) && isalpha(tmpSymbol[0])) nbc=1;
              else if(tmpSymbol.size()>=2)
                {
                  if(isalpha(tmpSymbol[0]) && isalpha(tmpSymbol[1])) nbc=2;
                  else if(isalpha(tmpSymbol[0])) nbc=1;
                }
              
              OBAtom *atom  = pmol->NewAtom();
              
              vLabelOBatom.insert(make_pair(posat->mLabel,atom));
              
              if(tmpSymbol.size()>nbc)
                {// Try to find a formal charge in the symbol
                  int charge=0;
                  int sign=0;
                  for(unsigned int i=nbc;i<tmpSymbol.size();++i)
                    {// Use first number found as formal charge
                      if(isdigit(tmpSymbol[i]) && (charge==0)) charge=atoi(tmpSymbol.substr(i,1).c_str());
                      if('-'==tmpSymbol[i]) sign-=1;
                      if('+'==tmpSymbol[i]) sign+=1;
                    }
                  if(0!=sign) // no sign, no charge
                    {
                      if(charge==0) charge=1;
                      cout<<tmpSymbol<<" / symbol="<<tmpSymbol.substr(0,nbc)<<" charge= "<<sign*charge<<endl;
                      atom->SetFormalCharge(sign*charge);
                    }
                }
              
              if(nbc>0) tmpSymbol=tmpSymbol.substr(0,nbc);
              else tmpSymbol="C";//Something went wrong, no symbol ! Default to C ??
              
              int atomicNum = etab.GetAtomicNum(tmpSymbol.c_str());
              atom->SetAtomicNum(atomicNum); //set atomic number, or '0' if the atom type is not recognized
              atom->SetType(tmpSymbol); //set atomic number, or '0' if the atom type is not recognized
              atom->SetVector(posat->mCoordCart[0],posat->mCoordCart[1],posat->mCoordCart[2]);
            }
          if (!pConv->IsOption("b",OBConversion::INOPTIONS))
            pmol->ConnectTheDots();
          if (pConv->IsOption("B",OBConversion::INOPTIONS))
            {
              for(vector<CIFData::CIFBond>::const_iterator posbond=pos->second.mvBond.begin();posbond!=pos->second.mvBond.end();++posbond)
                {// Add bonds present in the cif and not detected by ConnectTheDots()
                  std::map<std::string,OBAtom *>::iterator posat1,posat2;
                  posat1=vLabelOBatom.find(posbond->mLabel1);
                  posat2=vLabelOBatom.find(posbond->mLabel2);
                  if(posat1!=vLabelOBatom.end() && posat2!=vLabelOBatom.end())
                    {
                      if(verbose) cout<<"  Adding cif bond ? "<<posat1->first<<"-"<<posat2->first;
                      if(pmol->GetBond(posat1->second,posat2->second)==NULL)
                        {
                           if(verbose) cout<<"  :Bond added !"<<endl;
                           OBBond * bond=pmol->NewBond();
                           bond->SetBegin(posat1->second);
                           bond->SetEnd(posat2->second);
                           bond->SetBondOrder(1);
                           bond->SetLength(double(posbond->mDistance));
                        }
                       else if(verbose) cout<<"  :Bond already present.. "<<endl;
                    }
                }
            }
          if (!pConv->IsOption("s",OBConversion::INOPTIONS) && !pConv->IsOption("b",OBConversion::INOPTIONS))
            pmol->PerceiveBondOrders();
          pmol->EndModify();
          pmol->SetAutomaticFormalCharge(false); // we should have set formal charges
          return true;
        }

    // If we got here, no structure was found
    obErrorLog.ThrowError(__FUNCTION__, "Problems reading a CIF file: no structure found !" , obWarning);
    return(false);
  }

  ////////////////////////////////////////////////////////////////

  bool CIFFormat::WriteMolecule(OBBase* pOb, OBConversion* pConv)
  {
    OBMol* pmol = dynamic_cast<OBMol*>(pOb);
    if(pmol==NULL)
      return false;
    ostream &ofs = *pConv->GetOutStream();

    char buffer[BUFF_SIZE];

    ofs <<"# CIF file generated by openbabel "<<BABEL_VERSION<<", see http://openbabel.sf.net"<<endl;

    ofs << "data_I"<<endl;
    // Use pmol->GetTitle() as chemical name, though it will probably be the file name
    ofs <<"_chemical_name_common '"<<pmol->GetTitle()<<"'"<<endl;
    // Print Unit cell if we have it
    OBUnitCell *pUC=NULL;
    if (pmol->HasData(OBGenericDataType::UnitCell))
      {
        pUC = (OBUnitCell*)pmol->GetData(OBGenericDataType::UnitCell);
        ofs << "_cell_length_a " << pUC->GetA() << endl
            << "_cell_length_b " << pUC->GetB() << endl
            << "_cell_length_c " << pUC->GetC() << endl
            << "_cell_angle_alpha " << pUC->GetAlpha() << endl
            << "_cell_angle_beta "  << pUC->GetBeta() << endl
            << "_cell_angle_gamma " << pUC->GetGamma() << endl;
        // Save the space group if known
        const SpaceGroup* pSG = pUC->GetSpaceGroup();
        if (pSG != NULL)
          {
            ofs << "_space_group_name_Hall '" << pSG->GetHallName() << "'" << endl;
            ofs << "loop_" <<endl
                << "    _symmetry_equiv_pos_as_xyz" << endl;
            transform3dIterator ti;
            const transform3d *t = pSG->BeginTransform(ti);
            while(t)
              {
                ofs << "    '" << t->DescribeAsString() << "'" << endl;
                t = pSG->NextTransform(ti);
             }
          }
      }


    ofs <<"loop_"<<endl
        <<"    _atom_site_type_symbol"<<endl
        <<"    _atom_site_label"<<endl
        <<"    _atom_site_Cartn_x"<<endl
        <<"    _atom_site_Cartn_y"<<endl
        <<"    _atom_site_Cartn_z"<<endl;
    unsigned int i=0;
    FOR_ATOMS_OF_MOL(atom, *pmol)
      {
        snprintf(buffer, BUFF_SIZE, "    %3s  %3s%d  %10.5f %10.5f %10.5f\n",
                 etab.GetSymbol(atom->GetAtomicNum()),
                 etab.GetSymbol(atom->GetAtomicNum()),
                 ++i,
                 atom->GetX(),
                 atom->GetY(),
                 atom->GetZ());
        ofs << buffer;
      }
    return true;
  }

} //namespace OpenBabel
