	program draw
	integer,parameter::nn=150  !1500秒，每隔10s，输出一次故150个时间点
	integer,parameter::ixx=40000 !每个时刻个总网格点数,共40000个格点25×40×40
	integer nstep    !nstep为3trajxy.dat的头文件变量
	integer flag     !所有时刻的总的达到0.05的格点数目:900000=6000*150
	integer flag_A   !
	integer hail  !1个时刻内大于0.05的初始格点:6000,对应40000个格点有20*20*15=6000个格点
	real :: tim,x(ixx,nn),y(ixx,nn),z(ixx,nn)  !tim也为3trajxy.dat的头文件变量,x、y、z分别为所筛选的,所有冰雹模式的格点随时间变化的格点坐标
	real :: d(ixx,nn),ali(ixx,nn)   !
!	real :: traj(6000,nn,3)  !64个点*150个时刻*3个坐标轴
!	integer A(6000)
!	flag_A=0

    !********************************************************
    !  读取3trajxy.dat
    !********************************************************
	open(10,file='3trajxy.dat',form='unformatted',status='unknown')
	open(12,file='Trajectory_chose.txt',form='formatted')
	do i=1,nn
		read(10)nstep,tim
		read(10)x(:,i),y(:,i),z(:,i),d(:,i),ali(:,i)
!	      write(*,*) d(:,i)
	enddo
        write(*,*) MaxVal(d(:,:))  !求解出3dtrjxy.dat中的数据半径最大值
        write(*,*) MinVal(d(:,:))  !求解出3dtrjxy.dat中的数据半径最小值
	flag=0 
	 do i=1,nn
!	 do i=nn,nn
	        hail=0
	      do j=1,ixx
!<modify>
	      if (d(j,i).ge.0.05)then
	          flag=flag+1
	           hail=hail+1
	      end if
	      end do
	 end do
	 write(*,*) flag
	 write(*,*) hail
!    !********************************************************
!    ! 晒选6000个格点绘制雹胚运行轨迹
!    !********************************************************
!	 do i=nn,nn
!	      do j=1,ixx
!	      if (d(j,i).ge.0.05)then
!	          A(flag_A)=j
!	          flag_A=flag_A+1
!	      end if
!	      end do
!	 end do
!    !********************************************************
!    !  读取3trajxy.dat
!    !********************************************************
!	
!	
!	
!	do i=1,nn
!		do j=1,hail
!		   traj(j,1:nn,1)=x(A(j),1:nn)/50000.0
!		   traj(j,1:nn,2)=y(A(j),1:nn)/50000.0
!		   traj(j,1:nn,3)=z(A(j),1:nn)/50000.0
!		enddo
!	enddo
!	do i=1,nn
!	write(12,888)traj(1:hail,i,1),traj(1:hail,i,2),traj(1:hail,i,3)
!	enddo
!888   format(192f8.3)
!	
!	
!	
!	
!	
!	
!	
!	
!	
	end program
