
!
      SUBROUTINE Q_Initial_Conditions(VHpu,PH,QH,MWBase,XLpu,TMVABase,  &
     &Droop,DroopMVA,QLpu,QL,VRefHpu,PFH,PFL,TAPH)
! Compute low side quantities given high side quantities and transformer data
!
! Given high side terminal conditions, this routine computes:
!     - QLpu
!     - Power Factor (on high and low side)
!     - Voltage references on the high side (including droop effects)
! PQ direction is from LV to MV
!
! Inputs
      REAL VHpu,PH,QH,MWBase,XLpu,TMVABase,Droop,DroopMVA
      REAL PHpu,QHpu,PLpu
! Outputs
      REAL QLpu,QL,VRefHpu,PFH,PFL,TAPH
! Variables
      COMPLEX VH,SH,ZHL,ILH,VL,SL
 !
      PHpu = PH/MWBase
      QHpu = QH/MWBase
      SH  = CMPLX(PHpu,QHpu)
      VH  = CMPLX(VHpu,0.0)
      ILH = CONJG(SH/VH)
      ZHL  = CMPLX(0.0,XLpu)*MWBase/TMVABase ! Convert from TMVA Base to Power Base
      VL  = VH + ILH*ZHL
      TAPH = CABS(VL)
      SL  = VL*CONJG(ILH)
      QLpu = AIMAG(SL)
      QL = QLpu * MWBase
      PLpu = PHpu ! Assume no transformer losses
! Compute VRefHpu given droop
      VRefHpu = VHpu + (Droop*MWBase/DroopMVA)*QHpu
! Compute Power Factors
      IF ( CABS(SH) .GE. 1.0E-10 ) THEN
         PFH = PHpu / CABS(SH)
      ELSE
         IF ( PHpu .GE. 0 ) THEN
            PFH = 1.0
         ELSE
            PFH = -1.0
         ENDIF
      ENDIF
      IF ( CABS(SL) .GE. 1.0E-10 ) THEN
         PFL = PLpu / CABS(SL)
      ELSE
         IF ( PLpu .GE. 0 ) THEN
            PFL = 1.0
         ELSE
            PFL = -1.0
         ENDIF
      ENDIF
! For -ve QLpu, the sign of the PowerFactor needs to be inverted
      IF ( QHpu .LT. 0.0 ) PFH = -1.0*PFH
      IF ( QLpu .LT. 0.0 ) PFL = -1.0*PFL

      RETURN
      END
	  
SUBROUTINE Q_IniTerm(QMVPOI,PMVPOI,VMVPOI,Xpu,TMVABase,NoTF,QLVTERM)

 REAL QMVPOI,PMVPOI,Xpu,TMVABase,VMVPOI,NoTF
 REAL QLVTERM
 REAL MVABase
 COMPLEX I, V1, V2,X,S,Qout
 
 MVABase = TMVABase*NoTF
 X  = CMPLX(0.0,Xpu)
 V1 = CMPLX(VMVPOI,0.0)
 I = CMPLX(PMVPOI,QMVPOI)/MVABase/VMVPOI
 I = CONJG(I)
 V2 = V1+I*X
 S=V2*CONJG(I)
 QLVTERM = AIMAG(S)*MVABase

END