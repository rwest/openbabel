/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.31
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


public class FptIndexHeader {
  private long swigCPtr;
  protected boolean swigCMemOwn;

  protected FptIndexHeader(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(FptIndexHeader obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if(swigCPtr != 0 && swigCMemOwn) {
      swigCMemOwn = false;
      openbabelJNI.delete_FptIndexHeader(swigCPtr);
    }
    swigCPtr = 0;
  }

  public void setHeaderlength(long value) {
    openbabelJNI.FptIndexHeader_headerlength_set(swigCPtr, this, value);
  }

  public long getHeaderlength() {
    return openbabelJNI.FptIndexHeader_headerlength_get(swigCPtr, this);
  }

  public void setNEntries(long value) {
    openbabelJNI.FptIndexHeader_nEntries_set(swigCPtr, this, value);
  }

  public long getNEntries() {
    return openbabelJNI.FptIndexHeader_nEntries_get(swigCPtr, this);
  }

  public void setWords(long value) {
    openbabelJNI.FptIndexHeader_words_set(swigCPtr, this, value);
  }

  public long getWords() {
    return openbabelJNI.FptIndexHeader_words_get(swigCPtr, this);
  }

  public void setFpid(String value) {
    openbabelJNI.FptIndexHeader_fpid_set(swigCPtr, this, value);
  }

  public String getFpid() {
    return openbabelJNI.FptIndexHeader_fpid_get(swigCPtr, this);
  }

  public void setDatafilename(String value) {
    openbabelJNI.FptIndexHeader_datafilename_set(swigCPtr, this, value);
  }

  public String getDatafilename() {
    return openbabelJNI.FptIndexHeader_datafilename_get(swigCPtr, this);
  }

  public FptIndexHeader() {
    this(openbabelJNI.new_FptIndexHeader(), true);
  }

}
