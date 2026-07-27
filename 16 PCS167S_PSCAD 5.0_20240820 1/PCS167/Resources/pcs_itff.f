! ******************************************************
!             Subroutine for the PCS2
! ******************************************************
      
      SUBROUTINE AUX_PCS2CTRL(gridvolt, busvolt, setupword, modulecur, capcur, pqrefset, battmeas, commandword, tsample, mcbdrv,& 
      acmdrv, acsscdrv, dccdrv, dcsscdrv, dutym1, dutym2, dutym3, dutym4, pwmen, debugdata1, debugdata2)

      implicit none

      REAL gridvolt(2,1)
      REAL busvolt(2,1)
      REAL setupword
      REAL modulecur(3,1)
      REAL capcur(2,1)
      REAL pqrefset(2,1)
      REAL battmeas(3,1)
      REAL commandword
      REAL tsample
 
      REAL mcbdrv
      REAL acmdrv(4,1)
      REAL acsscdrv(4,1)
      REAL dccdrv(4,1)
      REAL dcsscdrv(4,1)
      REAL dutym1(3,1)
      REAL dutym2(3,1)
      REAL dutym3(3,1)
      REAL dutym4(3,1)
      REAL pwmen(4,1)
      REAL debugdata1(16,1)
      REAL debugdata2(16,1)

! intel fortran interface to a C procedure

      INTERFACE

         SUBROUTINE PCS_CTRL(gridvolt, busvolt, setupword, modulecur, capcur, pqrefset, battmeas, commandword, tsample, mcbdrv,&
       acmdrv, acsscdrv, dccdrv, dcsscdrv, dutym1, dutym2, dutym3, dutym4, pwmen, debugdata1, debugdata2)

            !DEC$ ATTRIBUTES C :: PCS_CTRL
            !DEC$ ATTRIBUTES REFERENCE :: gridvolt
            !DEC$ ATTRIBUTES REFERENCE :: busvolt
            !DEC$ ATTRIBUTES REFERENCE :: setupword
            !DEC$ ATTRIBUTES REFERENCE :: modulecur
            !DEC$ ATTRIBUTES REFERENCE :: capcur
            !DEC$ ATTRIBUTES REFERENCE :: pqrefset
            !DEC$ ATTRIBUTES REFERENCE :: battmeas
            !DEC$ ATTRIBUTES REFERENCE :: commandword
            !DEC$ ATTRIBUTES REFERENCE :: tsample

            !DEC$ ATTRIBUTES REFERENCE :: mcbdrv
            !DEC$ ATTRIBUTES REFERENCE :: acmdrv
            !DEC$ ATTRIBUTES REFERENCE :: acsscdrv
            !DEC$ ATTRIBUTES REFERENCE :: dccdrv
            !DEC$ ATTRIBUTES REFERENCE :: dcsscdrv
            !DEC$ ATTRIBUTES REFERENCE :: dutym1
            !DEC$ ATTRIBUTES REFERENCE :: dutym2
            !DEC$ ATTRIBUTES REFERENCE :: dutym3
            !DEC$ ATTRIBUTES REFERENCE :: dutym4
            !DEC$ ATTRIBUTES REFERENCE :: pwmen
            !DEC$ ATTRIBUTES REFERENCE :: debugdata1
            !DEC$ ATTRIBUTES REFERENCE :: debugdata2

! passed by REFERENCE

            REAL gridvolt(2,1)
            REAL busvolt(2,1)
            REAL setupword
            REAL modulecur(3,1)
            REAL capcur(2,1)
            REAL pqrefset(2,1)
            REAL battmeas(3,1)
            REAL commandword
            REAL tsample

            REAL mcbdrv
            REAL acmdrv(4,1)
            REAL acsscdrv(4,1)
            REAL dccdrv(4,1)
            REAL dcsscdrv(4,1)
            REAL dutym1(3,1)
            REAL dutym2(3,1)
            REAL dutym3(3,1)
            REAL dutym4(3,1)
            REAL pwmen(4,1)
            REAL debugdata1(16,1)
            REAL debugdata2(16,1)

         END SUBROUTINE

      END INTERFACE

! Call the C procedure

      CALL PCS_CTRL(gridvolt, busvolt, setupword, modulecur, capcur, pqrefset, battmeas, commandword, tsample, mcbdrv, &
      acmdrv, acsscdrv, dccdrv, dcsscdrv, dutym1, dutym2, dutym3, dutym4, pwmen, debugdata1, debugdata2)
      END



