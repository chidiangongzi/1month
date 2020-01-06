	program draw
	integer,parameter::nn=150  !1500*5秒，每隔10*5s，输出一次故150个时间点
	integer,parameter::ixx=40000 !共40000个格点25×40×40
	integer nstep
	real :: tim,x(ixx,nn),y(ixx,nn),z(ixx,nn)
	real :: d(ixx,nn),ali(ixx,nn)
	real :: traj(64,nn,3)  !64个点*150个时刻*3个坐标轴
        integer i,j,k,m,n
        integer A(64)
    !********************************************************
    !  筛选64个格点来绘制雹胚运行轨迹 
    !********************************************************
        m=1
        do j=1,4
           n=0
           do i=1,4
                A(m)=85+100*(j-1)+5*n
                n=n+1
                m=m+1
           enddo
        enddo
        m=17
        do k=1,3
           do j=1,4
                n=0
                do i=1,4
                     A(m)=1685+100*(j-1)+5*n+2000*(k-1)
                     n=n+1
                     m=m+1
                enddo
           enddo
        enddo
        write(*,*)A
! 读取3trajxy.dat
	open(10,file='3trajxy.dat',form='unformatted',status='unknown')
        open(12,file='Trajectory.txt',form='formatted')
	do i=1,nn
		read(10)nstep,tim
!<check>
!		write(*,*) nstep,tim
		read(10)x(:,i),y(:,i),z(:,i),d(:,i),ali(:,i)
		do j=1,64
		   traj(j,1:nn,1)=x(A(j),1:nn)/50000.0
		   traj(j,1:nn,2)=y(A(j),1:nn)/50000.0
		   traj(j,1:nn,3)=z(A(j),1:nn)/50000.0
		enddo
	enddo
	do i=1,nn
		write(12,888)traj(1:64,i,1),traj(1:64,i,2),traj(1:64,i,3)
	enddo
888   format(192f8.3)
!<check>
!	write(*,*)x(1:6000,1)/50000.0
!	write(*,*)y(1:6000,1)/50000.0
!	write(*,*)z(1:6000,1)/50000.0
!	write(*,*)d(1:600,1)
!	write(*,*)ali(1:6000,1)
!	write(*,*)traj(:,1,1)
	close(10)
	close(12)
	end
