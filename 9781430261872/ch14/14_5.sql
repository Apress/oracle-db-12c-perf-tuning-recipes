SELECT /*+ optimizer_features_enable('11.2.0.4') */ *
FROM EMP JOIN DEPT USING(DEPTNO);

alter session set optimizer_features_enable='11.2.0.4';

